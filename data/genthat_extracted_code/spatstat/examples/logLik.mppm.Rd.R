library(spatstat)


### Name: logLik.mppm
### Title: Log Likelihood and AIC for Multiple Point Process Model
### Aliases: logLik.mppm AIC.mppm extractAIC.mppm nobs.mppm getCall.mppm
###   terms.mppm
### Keywords: spatial models

### ** Examples

  fit <- mppm(Bugs ~ x, hyperframe(Bugs=waterstriders))
  logLik(fit)
  AIC(fit)
  nobs(fit)
  getCall(fit)



