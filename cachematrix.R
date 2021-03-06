+# These two functions work together to create a special
+# 'matrix' object and cache its inverse.
+
+## makeCacheMatrix creates a special "matrix" object
+## and caches its inverse.
+
+makeCacheMatrix <- function(x = matrix()) {
+        i <- NULL
+        set <- function(y) {
+              x <<- y
+              i <<- NULL
+        }
+        get <- function() x
+        setinv <- function(inv) i <<- inv
+        getinv <- function() i
+        list(set = set, get = get,
+             setinv = setinv, getinv = getinv)
+}
+
+
+## cacheSolve computes the inverse of the special "matrix"
+## returned by makeCacheMatrix, unless the inverse has
+## already been calculated. In this case, cacheSolve
+## retrieves the inverse from the cache.
+
+cacheSolve <- function(x, ...) {
+        ## Return a matrix that is the inverse of 'x'
+        i <- x$getinv()
+        if(!is.null(i)) {
+              message("getting cached data")
+              return(i)
+        }
+        mat <<- x$get()
+        i <- solve(mat, ...)
+        x$setinv(i)
+        i
+}
