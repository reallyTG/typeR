library(spatstat)


### Name: logLik.kppm
### Title: Log Likelihood and AIC for Fitted Cox or Cluster Point Process
###   Model
### Aliases: logLik.kppm AIC.kppm extractAIC.kppm nobs.kppm
### Keywords: spatial models

### ** Examples

  fit <- kppm(redwood ~ x, "Thomas", method="palm")
  nobs(fit)
  logLik(fit)
  extractAIC(fit)
  AIC(fit)
  step(fit)



