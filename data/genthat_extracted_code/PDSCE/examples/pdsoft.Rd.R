library(PDSCE)


### Name: pdsoft
### Title: A permutation invariant positive definite and sparse covariance
###   matrix estimate
### Aliases: pdsoft

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
s=cov(x)*(n-1)/n
output=pdsoft(s=s, lam=0.3)
output$sigma



