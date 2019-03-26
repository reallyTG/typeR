library(bsts)


### Name: summary.bsts
### Title: Summarize a Bayesian structural time series object
### Aliases: summary.bsts

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  model <- bsts(y, state.specification = ss, niter = 100)
  summary(model, burn  = 20)



