library(bsts)


### Name: plot.bsts.predictors
### Title: Plot the most likely predictors
### Aliases: PlotBstsPredictors

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  lag.y <- c(NA, head(y, -1))
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  ## Call bsts with na.action = na.omit to omit the leading NA in lag.y
  model <- bsts(y ~ lag.y, state.specification = ss, niter = 500,
                na.action = na.omit)
  plot(model, "predictors")



