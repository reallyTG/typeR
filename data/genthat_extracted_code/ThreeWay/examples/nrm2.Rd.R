library(ThreeWay)


### Name: nrm2
### Title: Columnwise normalization of a matrix
### Aliases: nrm2
### Keywords: array multivariate algebra

### ** Examples

X <- matrix(rnorm(6*3),ncol=3)
Y <- nrm2(X)
apply(Y^2, 2, sum)



