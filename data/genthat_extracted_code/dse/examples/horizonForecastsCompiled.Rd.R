library(dse)


### Name: horizonForecastsCompiled
### Title: Calculate forecasts at specified horizons
### Aliases: horizonForecastsCompiled horizonForecastsCompiled.ARMA
###   horizonForecastsCompiled.SS
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
z <-  horizonForecasts(model, eg1.DSE.data.diff)



