library(bsts)


### Name: add.trig
### Title: Trigonometric Seasonal State Component
### Aliases: AddTrig
### Keywords: models

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddTrig(ss, y, period = 12, frequencies = 1:3)
  model <- bsts(y, state.specification = ss, niter = 200)
  plot(model)

  ## The "harmonic" method is much more stable than the "direct" method.
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddTrig(ss, y, period = 12, frequencies = 1:3, method = "direct")
  model2 <- bsts(y, state.specification = ss, niter = 200)
  plot(model2)




