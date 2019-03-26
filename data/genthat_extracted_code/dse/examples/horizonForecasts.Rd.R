library(dse)


### Name: horizonForecasts
### Title: Calculate forecasts at specified horizons
### Aliases: horizonForecasts horizonForecasts.TSdata
###   horizonForecasts.TSmodel horizonForecasts.TSestModel
###   horizonForecasts.forecastCov is.horizonForecasts
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
z <-  horizonForecasts(model, eg1.DSE.data.diff)



