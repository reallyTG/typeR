library(systemicrisk)


### Name: GibbsSteps_kcycle
### Title: Gibbs sampling step of a matrix in the ERE model
### Aliases: GibbsSteps_kcycle

### ** Examples

L <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3)
diag(L) <- 0
lambda <- matrix(0.5,nrow=3,ncol=3)
p <- matrix(0.7, nrow=3,ncol=3)
diag(p) <- 0
GibbsSteps_kcycle(L=L,lambda=lambda,p=p)
L
L <- matrix(1:16,nrow=4)
diag(L) <- 0
lambda <- matrix(0.5,nrow=4,ncol=4)
p <- matrix(0.25, nrow=4,ncol=4)
diag(p) <- 0
GibbsSteps_kcycle(L=L,lambda=lambda,p=p)
L



