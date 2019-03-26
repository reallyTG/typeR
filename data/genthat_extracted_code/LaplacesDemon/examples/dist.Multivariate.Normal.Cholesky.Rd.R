library(LaplacesDemon)


### Name: dist.Multivariate.Normal.Cholesky
### Title: Multivariate Normal Distribution: Cholesky Parameterization
### Aliases: dmvnc rmvnc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
Sigma <- diag(3)
U <- chol(Sigma)
x <- dmvnc(c(1,2,3), c(0,1,2), U)
X <- rmvnc(1000, c(0,1,2), U)
joint.density.plot(X[,1], X[,2], color=TRUE)



