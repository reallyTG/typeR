library(madness)


### Name: outer
### Title: Outer product.
### Aliases: outer outer,ANY,ANY-method outer outer,madness,madness-method
###   outer,madness,array-method outer,array,madness-method %o%
###   kronecker,madness,madness-method kronecker,madness,madness-class
###   kronecker,madness,array-method kronecker,madness,array-class
###   kronecker,array,madness-method kronecker,array,madness-class

### ** Examples

set.seed(123)
y <- array(rnorm(3*3),dim=c(3,3))
dy <- matrix(rnorm(length(y)*2),ncol=2)
dx <- crossprod(matrix(rnorm(ncol(dy)*100),nrow=100))
obj0 <- madness(val=y,vtag='y',xtag='x',dvdx=dy,varx=dx)

y1 <- array(rnorm(3*3),dim=c(3,3))
dy1 <- matrix(rnorm(length(y1)*2),ncol=2)
dx1 <- crossprod(matrix(rnorm(ncol(dy1)*100),nrow=100))
obj1 <- madness(val=y1,vtag='y1',xtag='x',dvdx=dy1,varx=dx1)

anobj <- outer(obj0,obj0,'*')
anobj <- outer(obj0,obj0,'+')
anobj <- outer(obj0,obj1,'-')
anobj <- outer(obj0,obj1,'/')




