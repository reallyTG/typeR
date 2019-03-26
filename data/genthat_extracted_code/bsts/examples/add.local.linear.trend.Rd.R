library(bsts)


### Name: add.local.linear.trend
### Title: Local linear trend state component
### Aliases: AddLocalLinearTrend
### Keywords: models

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  model <- bsts(y, state.specification = ss, niter = 500)
  pred <- predict(model, horizon = 12, burn = 100)
  plot(pred)



