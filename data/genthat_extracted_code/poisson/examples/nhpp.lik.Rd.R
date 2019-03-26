library(poisson)


### Name: nhpp.lik
### Title: Non-homogeneous Poisson process likelihood
### Aliases: nhpp.lik
### Keywords: poisson likelihood NHPP

### ** Examples

intensity <- function(t) pmin(t/3, 1)
X = c(0.74, 1.50, 1.67, 2.01, 2.27)
nhpp.lik(X, T1 = 2.3, rate = 5, prob.func = intensity)
nhpp.lik(X, T1 = 2.3, rate = 6, prob.func = intensity)
nhpp.lik(X, T1 = 2.3, rate = 7, prob.func = intensity)
# 6 is the most likely of these three rates



