## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.

# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)

makeCacheMatrix <- function(x = numeric()) {
  cache <- NULL
  setMatrix <- function(y) {
    x <<- y
    cahce <- NULL
  }
  
  getMatrix <- function(){
  x
  }
  
  cacheInverse <- function(inverse) {
  cache <<- inverse
  }
  
  getInverse <- function() {
  cache
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

## cacheSolve: This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  inverse.cache <- x$getInverse()
  if(!is.null(inverse.cache)) {
    message("getting cached data")
    return(inverse.cache)
  }
  data.matrix <- x$getMatrix()
  inverse.cache <- solve(data.matrix)
  x$cacheInverse(inverse.cache)
  inverse.cache
}



