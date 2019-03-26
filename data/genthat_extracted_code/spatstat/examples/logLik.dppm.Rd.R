library(spatstat)


### Name: logLik.dppm
### Title: Log Likelihood and AIC for Fitted Determinantal Point Process
###   Model
### Aliases: logLik.dppm AIC.dppm extractAIC.dppm nobs.dppm
### Keywords: spatial models

### ** Examples

  fit <- dppm(swedishpines ~ x, dppGauss(), method="palm")
  nobs(fit)
  logLik(fit)
  extractAIC(fit)
  AIC(fit)



