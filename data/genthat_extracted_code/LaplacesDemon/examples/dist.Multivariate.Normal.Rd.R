library(LaplacesDemon)


### Name: dist.Multivariate.Normal
### Title: Multivariate Normal Distribution
### Aliases: dmvn rmvn
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- dmvn(c(1,2,3), c(0,1,2), diag(3))
X <- rmvn(1000, c(0,1,2), diag(3))
joint.density.plot(X[,1], X[,2], color=TRUE)



