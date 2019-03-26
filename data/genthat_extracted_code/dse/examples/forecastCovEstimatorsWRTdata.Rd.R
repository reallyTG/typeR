library(dse)


### Name: forecastCovEstimatorsWRTdata
### Title: Calculate Forecast Cov of Estimators WRT Data
### Aliases: forecastCovEstimatorsWRTdata is.forecastCovEstimatorsWRTdata
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <- forecastCovEstimatorsWRTdata(eg1.DSE.data.diff, 
    estimation.methods=list(estVARXls=list(max.lag=4)))



