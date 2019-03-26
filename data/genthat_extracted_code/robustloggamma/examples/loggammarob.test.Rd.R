library(robustloggamma)


### Name: loggammarob.test
### Title: Robust inference for the generalized loggamma model.
### Aliases: loggammarob.test
### Keywords: robust models

### ** Examples

  set.seed(1234)
  x <- sort(rloggamma(n=80, lambda=1))
  res <- loggammarob(x, control=loggammarob.control(lower=0, upper=2, n=30))
  loggammarob.test(res, mu=0) #only location
  loggammarob.test(res, mu=0, sigma=1) #location and scale
  loggammarob.test(res, eta=1) #E(exp(X))



