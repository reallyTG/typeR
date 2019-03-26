library(spatstat)


### Name: methods.lppm
### Title: Methods for Fitted Point Process Models on a Linear Network
### Aliases: methods.lppm coef.lppm emend.lppm extractAIC.lppm formula.lppm
###   logLik.lppm deviance.lppm nobs.lppm print.lppm summary.lppm
###   terms.lppm update.lppm valid.lppm vcov.lppm as.linnet.lppm
### Keywords: spatial models

### ** Examples

  X <- runiflpp(15, simplenet)
  fit <- lppm(X ~ x)
  print(fit)
  coef(fit)
  formula(fit)
  terms(fit)
  logLik(fit)
  deviance(fit)
  nobs(fit)
  extractAIC(fit)
  update(fit, ~1)
  valid(fit)
  vcov(fit)



