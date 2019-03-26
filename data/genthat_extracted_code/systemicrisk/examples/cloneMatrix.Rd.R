library(systemicrisk)


### Name: cloneMatrix
### Title: Creates a deep copy of a matrix
### Aliases: cloneMatrix

### ** Examples

lambda <- matrix(0.5,nrow=2,ncol=2)
p <- matrix(0.7, nrow=2,ncol=2)
L <- matrix(rexp(4),nrow=2);
L
Lold <- L
Lcopy <- cloneMatrix(L)
ERE_step_cycle(r=c(0,1),c=c(0,1),L=L,lambda=lambda,p=p)

L     ## new value
Lold  ## equal to L !!!
Lcopy ## still has the original value



