library(spatstat)


### Name: logLik.ppm
### Title: Log Likelihood and AIC for Point Process Model
### Aliases: logLik.ppm deviance.ppm AIC.ppm extractAIC.ppm nobs.ppm
### Keywords: spatial models

### ** Examples

  data(cells)
  fit <- ppm(cells, ~x)
  nobs(fit)
  logLik(fit)
  deviance(fit)
  extractAIC(fit)
  AIC(fit)
  step(fit)



