library(LaplacesDemon)


### Name: dist.Multivariate.Laplace
### Title: Multivariate Laplace Distribution
### Aliases: dmvl rmvl
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dmvl(c(1,2,3), c(0,1,2), diag(3))
X <- rmvl(1000, c(0,1,2), diag(3))
joint.density.plot(X[,1], X[,2], color=TRUE)



