library(cernn)


### Name: cernn
### Title: Compute the regularization path for Covariance Estimate
###   Regularized by Nuclear Norms (CERNN)
### Aliases: cernn

### ** Examples

n <- 10
p <- 5
set.seed(12345)
X <- matrix(rnorm(n*p),n,p)
alpha <- get_alpha(X)
lambda <- 10**(seq(-1,4,length.out=100))
sol_path <- cernn(X,lambda,alpha)
df <- t(sol_path$e)

## Plot regularization paths of eigenvalues
matplot(x=log10(lambda),y=df,type='l',ylab='shrunken eigenvalue')
grand_mean <- (norm(scale(X,center=TRUE,scale=FALSE),'f')**2)/(n*p)
abline(h=grand_mean)



