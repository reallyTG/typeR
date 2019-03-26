library(ThreeWay)


### Name: Cc
### Title: Columnwise centering of a matrix
### Aliases: Cc
### Keywords: array multivariate algebra

### ** Examples

X <- matrix(rnorm(6*3),ncol=3)
Y <- Cc(X)
apply(Y,2,mean)



