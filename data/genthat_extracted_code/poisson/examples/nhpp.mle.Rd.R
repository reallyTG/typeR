library(poisson)


### Name: nhpp.mle
### Title: Get the maximum-likelihood rate parameter of an NHPP
###   (non-homogenous Poisson process)
### Aliases: nhpp.mle
### Keywords: poisson maximum likelihood MLE NHPP

### ** Examples

intensity <- function(t) pmin(t/3, 1)
X = c(0.74, 1.50, 1.67, 2.01, 2.27)
nhpp.mle(X, T1=1, prob.func=intensity, max.val = 70)



