library(madness)


### Name: blockrep
### Title: Replicate blocks of multidimensional value.
### Aliases: blockrep repto

### ** Examples

set.seed(123)
y <- array(rnorm(3*3),dim=c(3,3))
dy <- matrix(rnorm(length(y)*2),ncol=2)
dx <- crossprod(matrix(rnorm(ncol(dy)*100),nrow=100))
obj0 <- madness(val=y,vtag='y',xtag='x',dvdx=dy,varx=dx)

anobj <- blockrep(obj0,c(1,2,1))
anobj <- blockrep(obj0,c(1,1,2))
anobj <- repto(obj0,c(9,12,4))



