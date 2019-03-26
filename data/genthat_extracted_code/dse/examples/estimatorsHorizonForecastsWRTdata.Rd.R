library(dse)


### Name: estimatorsHorizonForecastsWRTdata
### Title: Estimate models and forecast at given horizons
### Aliases: estimatorsHorizonForecastsWRTdata
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <-  estimatorsHorizonForecastsWRTdata(eg1.DSE.data.diff, 
    estimation.methods=list(estVARXls=list(max.lag=3), 
                estVARXar=list(max.lag=3)))



