library(bsts)


### Name: one.step.prediction.errors
### Title: Prediction Errors
### Aliases: bsts.prediction.errors
### Keywords: models regression

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)

## Not run: 
##D   model <- bsts(y, state.specification = ss, niter = 500)
## End(Not run)
## Don't show: 
  model <- bsts(y, state.specification = ss, niter = 200)
## End(Don't show)
  errors <- bsts.prediction.errors(model, burn = 100)
  PlotDynamicDistribution(errors$in.sample)

  ## Compute out of sample prediction errors beyond times 80 and 120.
  errors <- bsts.prediction.errors(model, cutpoints = c(80, 120))
  plot(model, "prediction.errors", cutpoints = c(80, 120))
  str(errors)     ## three matrices, with 400 ( = 500 - 100) rows
                  ## and length(y) columns



