library(dse)


### Name: forecastCovEstimatorsWRTtrue
### Title: Compare Forecasts Cov Relative to True Model Output
### Aliases: forecastCovEstimatorsWRTtrue is.forecastCovEstimatorsWRTtrue
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
true.model <- estVARXls(eg1.DSE.data.diff) # just to have a starting model
z <-  forecastCovEstimatorsWRTtrue(true.model, 
    estimation.methods=list(estVARXls=list(max.lag=4)))



