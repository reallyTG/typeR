library(cernn)


### Name: shrink_eigen
### Title: Nonlinear shrinkage of sample eigenvalues
### Aliases: shrink_eigen

### ** Examples

set.seed(12345)
nLambda <- 100
lambda <- 10**seq(-2,2,length.out=nLambda)
alpha <- 0.5
n <- 10
p <- 5
d <- sort(2*runif(p))
e <- shrink_eigen(d,lambda,alpha,n)

## Plot regularization paths of eigenvalues
matplot(x=log10(lambda),y=t(e),type='l',ylab='shrunken eigenvalue')



