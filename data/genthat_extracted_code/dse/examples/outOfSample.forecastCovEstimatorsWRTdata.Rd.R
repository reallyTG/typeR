library(dse)


### Name: outOfSample.forecastCovEstimatorsWRTdata
### Title: Calculate Out-of-Sample Forecasts
### Aliases: outOfSample.forecastCovEstimatorsWRTdata
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <-  outOfSample.forecastCovEstimatorsWRTdata(eg1.DSE.data.diff,
           estimation.methods=list(estVARXls=list(max.lag=4)))



