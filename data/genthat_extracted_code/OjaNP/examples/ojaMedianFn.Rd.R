library(OjaNP)


### Name: ojaMedianFn
### Title: Value of the Oja Criterion
### Aliases: ojaMedianFn
### Keywords: multivariate nonparametric

### ** Examples

data(biochem)
X <- as.matrix(biochem[,1:2])
x <- ojaMedian(X)
ojaMedianFn(X, x)
ojaMedianFn(X, c(1.1, 0.4))



