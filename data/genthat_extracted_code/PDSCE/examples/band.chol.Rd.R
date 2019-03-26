library(PDSCE)


### Name: band.chol
### Title: Computes the banded covariance estimator by banding the
###   covariance Cholesky factor
### Aliases: band.chol

### ** Examples

set.seed(1)
n=50
p=20
true.cov=diag(p)
true.cov[cbind(1:(p-1), 2:p)]=0.4
true.cov[cbind(2:p, 1:(p-1))]=0.4
eo=eigen(true.cov, symmetric=TRUE)
z=matrix(rnorm(n*p), nrow=n, ncol=p)
x=z%*% tcrossprod(eo$vec*rep(eo$val^(0.5), each=p),eo$vec)
sigma=band.chol(x=x, k=1)
sigma 



