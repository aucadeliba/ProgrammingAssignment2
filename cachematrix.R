## This is a pair of functions to work together: 

## 1-makeCacheMatrix: creates a list that contains 4 functions used to create a "cache" of the inverse of a given matrix.

## 2-cacheSolve: will calculate the inverse of the above mentioned matrix and store its inverse in the "cache", so if called again it returns this inverse without making the calculation.

## Please *****bear in mind the assumptions listed in the assigment notes*****
## Kindly note that you need to store makeCacheMatrix in an object ot be able to see the results on R ie: V<- makeCacheMatrix(*square matrix to go here*).



## 1- makeCacheMatrix will create the  a list containing 4 functions:
	## setm: to set the the matrix. Will run everytime a new matrix is supplied by calling makeCacheMatrix.
	## getm: to get the matrix. Will be called by cacheSolve if the matrix is "new".
	## setinversem: to store the inverse of the matrix provided. Will be called by cacheSolve to store the newly calculated inverse matrix.
	## getinversem: to return the stored inverse matrix. Will be called by cacheSolve to return the inverse matrix form cahce, skipping the calculation.



makeCacheMatrix <- function(x = matrix()) {

       		
		ivm <- NULL     				##this initializes the "cache".

        
        setm <- function(y) {    				##Used to store the new matrix in the list that will be the result of this function.

                x <<- y 

                ivm <<- NULL    
        
                         }

        getm <- function() x     				## Just used to return the matrix stored, in the 2nd function: cacheSolve

        	
        setinversem <- function(inverse) ivm <<- inverse      	##Stores the inverse matrix once the 2nd function is run(creates the cache).

        
        getinversem <- function() ivm      			##Again only used to return the inverse matrix stored, when called by cacheSolve


        list(setm=setm, getm=getm, setinversem=setinversem, getinversem=getinversem)  
}


## 2- cacheSolve will do the inverse matrix calculation, or get it from the cache if it is already stored.
## To find if the inverse is alrady in cache, it uses ivm as a "flag", if it is null, then a new matrix has been created. 


cacheSolve <- function(x, ...) {

        	ivm <- x$getinversem()

       		if(!is.null(ivm)) { 				##If ivm is NULL then it is a new matrix, if not, it is the same as previously used.

                message("getting cached data.")

                return(inv) 					##This ends the function if the inverse matrix was in cache. 
        }

      								##The calculations below only happen if ivm==NULL (new matrix enteredin makeCacheMatrix)

        	matx <- x$getm()

        	inv <- solve(matx)

       		x$setinversem(ivm) 				##In this line we store the inverse matrix just calculated, in the list created by makeCacheMatrix
        ivm
}