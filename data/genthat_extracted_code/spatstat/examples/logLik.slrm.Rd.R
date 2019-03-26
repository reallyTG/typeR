library(spatstat)


### Name: logLik.slrm
### Title: Loglikelihood of Spatial Logistic Regression
### Aliases: logLik.slrm
### Keywords: spatial models methods

### ** Examples

  X <- rpoispp(42)
  fit <- slrm(X ~ x+y)
  logLik(fit)
  logLik(fit, adjust=FALSE)



