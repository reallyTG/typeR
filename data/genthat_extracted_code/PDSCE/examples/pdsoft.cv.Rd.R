library(PDSCE)


### Name: pdsoft.cv
### Title: Tuning parameter selection and computation for the positive
###   definite and sparse covariance matrix estimator
### Aliases: pdsoft.cv

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
output=pdsoft.cv(x=x)
plot(output$lam.vec, output$cv.err)
output$best.lam
output$sigma



