## Functions for storing and computing cachable inverse matrix

## function to make matrix be able to store already computed inverse

makeCacheMatrix <- function(x = matrix()) {
  inv_mrx <-NULL
  get <- function () x
  set <- function (y){
    x <<-y
    inv_mrx <<-NULL
  } 
  set_inv <- function(inv) inv_mrx<<-inv
  get_inv <- function() inv_mrx
  out <- list(get=get,
              set=set,
              set_inv=set_inv,
              get_inv=get_inv)
}


## function for computing inverse matrix from list made by makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv_mrx <- cached_mrx$get_inv()
  if (!is.null(inv_mrx)){
    print ('cached result')
    return (inv_mrx)
  }
  inv_mrx <-solve(cached_mrx$get())
  cached_mrx$set_inv(inv_mrx)
  inv_mrx
}
