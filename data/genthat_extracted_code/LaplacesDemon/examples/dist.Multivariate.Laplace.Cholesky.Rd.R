library(LaplacesDemon)


### Name: dist.Multivariate.Laplace.Cholesky
### Title: Multivariate Laplace Distribution: Cholesky Parameterization
### Aliases: dmvlc rmvlc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
Sigma <- diag(3)
U <- chol(Sigma)
x <- dmvlc(c(1,2,3), c(0,1,2), U)
X <- rmvlc(1000, c(0,1,2), U)
joint.density.plot(X[,1], X[,2], color=TRUE)



