library(LaplacesDemon)


### Name: dist.Multivariate.Normal.Precision
### Title: Multivariate Normal Distribution: Precision Parameterization
### Aliases: dmvnp rmvnp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dmvnp(c(1,2,3), c(0,1,2), diag(3))
X <- rmvnp(1000, c(0,1,2), diag(3))
joint.density.plot(X[,1], X[,2], color=TRUE)



