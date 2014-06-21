## create cacheable matrix object
#  m<- makeCacheMatrix( )Put comments here that give an overall description of what your
## initailize with a an easy to inspect matrix 
#  m$set( matrix( c(1, 2, 2, 1 ), 2, 2))
## note use of parens to retrive the matrix part of the object
#  m$get()
## test the inverse cacher
#cacheSolve( m )
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
i  <- NULL
        set  <- function(y){
                x <<- y
                i <<- NULL 
        }
        get  <- function() x
        setinverse  <- function(inverse) i  <<- inverse
        getinverse  <- function() i
        list(set= set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)


}


## Write a short comment describing this function
## test the inverse cacher
#  cacheSolve( m )
cacheSolve <- function(x, ...) {
 
 i  <- x$getinverse()
        if (!is.null(i)){
                message("getting cached data")
                return(i)
#getting cached data <-- NOTE THE MESSAGE
# ...
        }
# test that the inverse works and experiment with how to use the functions
# m$get() returns the matrix and cacheSolve(m) returns the inverse that we can 
# use like regular matrices to do things like multilplications...
#
# product of matrix mult should be identity matrix AND we should get the cached message
# m$get() %*% cacheSolve(m)
#getting cached data
# let R test identify for us
# all.equal( diag(2), m$get() %*% cacheSolve(m) )
# getting cached data 
        data  <- x$get()
        i  <- solve(data, ...)
        x$setinverse(i)
        i
       ## Return a matrix that is the inverse of 'x'
}
## save the inverse off and let's see if we can break it...
# m1<- cacheSolve(m)

## set m to some new values
# m$set( matrix( rnorm(4), 2, 2) )

## does fetching the inverse without any pre-caching work?
# all.equal( diag(2), m$get() %*% cacheSolve(m) )
#[1] TRUE             

## what about testing m x the inverse we squirreled away in m1?
# all.equal( diag(2), m$get() %*% m1 )
#[1] "Mean relative difference: xxxx"    

## try a bigger matrix and see if we can notice the caching effects
# m$set( matrix( rnorm( 1000000 ), 1000, 1000 ) )
# cacheSolve(m)
# cacheSolve(m)
## on my quad i5, seems like the second call is faster...

## and double check it all still works...
# all.equal( diag( 1000 ), m$get() %*% cacheSolve(m) )
# getting cached data
# [1] TRUE
