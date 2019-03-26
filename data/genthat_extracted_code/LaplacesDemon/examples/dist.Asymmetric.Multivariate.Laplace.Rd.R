library(LaplacesDemon)


### Name: dist.Asymmetric.Multivariate.Laplace
### Title: Asymmetric Multivariate Laplace Distribution
### Aliases: daml raml
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- daml(c(1,2,3), c(0,1,2), diag(3))
X <- raml(1000, c(0,1,2), diag(3))
joint.density.plot(X[,1], X[,2], color=FALSE)



