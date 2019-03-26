library(madness)


### Name: marithops
### Title: Basic Matrix Arithmetic Operations.
### Aliases: marithops %*%,madness,madness-method
###   `%*%`,madness,madness-class %*%,madness,array-method
###   %*%,madness,array-class %*%,array,madness-method
###   %*%,array,madness-class crossprod,madness,madness-method crossprod
###   crossprod,madness,ANY-method crossprod,madness,missing-method
###   crossprod,ANY,madness-method tcrossprod,madness,madness-method
###   tcrossprod tcrossprod,madness,ANY-method
###   tcrossprod,madness,missing-method tcrossprod,ANY,madness-method

### ** Examples

set.seed(123)
y <- array(rnorm(3*3),dim=c(3,3))
dy <- matrix(rnorm(length(y)*2),ncol=2)
dx <- crossprod(matrix(rnorm(ncol(dy)*100),nrow=100))
obj0 <- madness(val=y,vtag='y',xtag='x',dvdx=dy,varx=dx)
z <- array(rnorm(3*3),dim=c(3,3))

anobj <- obj0 %*% obj0
anobj <- z %*% obj0
anobj <- crossprod(obj0)
anobj <- crossprod(obj0,z)
anobj <- tcrossprod(obj0,obj0)
# NYI: 
# anobj <- obj0 %x% obj0




