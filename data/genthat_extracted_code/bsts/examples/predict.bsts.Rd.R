library(bsts)


### Name: predict.bsts
### Title: Prediction for bayesian structural time series
### Aliases: predict.bsts bsts.prediction
### Keywords: models regression

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  model <- bsts(y, state.specification = ss, niter = 500)
  pred <- predict(model, horizon = 12, burn = 100)
  plot(pred)



