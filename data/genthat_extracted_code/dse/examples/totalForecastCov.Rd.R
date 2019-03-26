library(dse)


### Name: totalForecastCov
### Title: Sum covariance of forecasts across all series
### Aliases: totalForecastCov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model1 <- estVARXar(eg1.DSE.data.diff)
model2 <- estVARXls(eg1.DSE.data.diff)
z <-  totalForecastCov(forecastCov(model1, model2,
                         data=trimNA(eg1.DSE.data.diff)))



