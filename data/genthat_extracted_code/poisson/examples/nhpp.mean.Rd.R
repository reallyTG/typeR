library(poisson)


### Name: nhpp.mean
### Title: Expected value of a non-homogeneous Poisson process.
### Aliases: nhpp.mean
### Keywords: poisson nhhp

### ** Examples

intensity <- function(t) pmin(t/3, 1)
nhpp.mean(rate = 20, t1 = 5, maximum = 50, prob.func=intensity)



