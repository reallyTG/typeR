library(svd)


### Name: extmat-class
### Title: Class '"extmat"'
### Aliases: extmat-class %*%,extmat,extmat-method %*%,extmat,matrix-method
###   %*%,extmat,numeric-method %*%,matrix,extmat-method
###   %*%,numeric,extmat-method as.array,extmat-method
###   as.integer,extmat-method as.logical,extmat-method
###   as.matrix,extmat-method as.numeric,extmat-method
###   as.vector,extmat-method crossprod,ANY,extmat-method
###   crossprod,extmat,ANY-method crossprod,extmat,extmat-method
###   crossprod,extmat,missing-method dim,extmat-method
###   length,extmat-method t,extmat-method tcrossprod,ANY,extmat-method
###   tcrossprod,extmat,ANY-method tcrossprod,extmat,extmat-method
###   tcrossprod,extmat,missing-method
### Keywords: classes

### ** Examples

## Not run: 
##D library(Matrix)
##D f <- function(v) as.numeric(A %*% v) # Convert Matrix object back to vector
##D tf <- function(v) as.numeric(tA %*% v) # Convert Matrix object back to vector
##D 
##D e <- new.env()
##D assign("A", USCounties, e)
##D assign("tA", t(USCounties), e)
##D environment(f) <- e
##D environment(tf) <- e
##D 
##D m <-extmat(f, tf, nrow(USCounties), ncol(USCounties))
##D system.time(v1 <- propack.svd(m, neig = 10))
##D #   user  system elapsed 
##D #  0.252   0.007   0.259 
##D system.time(v2 <- propack.svd(as.matrix(USCounties), neig = 10))
##D #   user  system elapsed 
##D #  8.563   0.027   8.590 
## End(Not run)



