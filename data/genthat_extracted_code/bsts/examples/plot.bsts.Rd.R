library(bsts)


### Name: plot.bsts
### Title: Plotting functions for Bayesian structural time series
### Aliases: plot.bsts PlotBstsCoefficients PlotBstsComponents
###   PlotBstsState PlotBstsResiduals PlotBstsPredictionErrors PlotBstsSize
###   PlotDynamicRegression PlotBstsForecastDistribution PlotSeasonalEffect
###   PlotMonthlyAnnualCycle

### ** Examples

  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  model <- bsts(y, state.specification = ss, niter = 500)
  plot(model, burn = 100)
  plot(model, "residuals", burn = 100)
  plot(model, "components", burn = 100)
  plot(model, "forecast.distribution", burn = 100)



