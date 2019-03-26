library(LaplacesDemon)


### Name: dist.Multivariate.Normal.Precision.Cholesky
### Title: Multivariate Normal Distribution: Precision-Cholesky
###   Parameterization
### Aliases: dmvnpc rmvnpc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
Omega <- diag(3)
U <- chol(Omega)
x <- dmvnpc(c(1,2,3), c(0,1,2), U)
X <- rmvnpc(1000, c(0,1,2), U)
joint.density.plot(X[,1], X[,2], color=TRUE)



