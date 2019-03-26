library(dlm)


### Name: rwishart
### Title: Random Wishart matrix
### Aliases: rwishart
### Keywords: distribution

### ** Examples

rwishart(25, p = 3)
a <- matrix(rnorm(9), 3)
rwishart(30, SqrtSigma = a)
b <- crossprod(a)
rwishart(30, Sigma = b)



