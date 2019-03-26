library(spatstat)


### Name: vcov.slrm
### Title: Variance-Covariance Matrix for a Fitted Spatial Logistic
###   Regression
### Aliases: vcov.slrm
### Keywords: spatial methods models

### ** Examples

  X <- rpoispp(42)
  fit <- slrm(X ~ x + y)
  vcov(fit)
  vcov(fit, what="corr")
  vcov(fit, what="f")



