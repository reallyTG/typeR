library(dse)


### Name: tfplot.forecastCov
### Title: Plots of Forecast Variance
### Aliases: tfplot.forecastCov tfplot.forecastCovEstimatorsWRTdata
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- estVARXls(eg1.DSE.data.diff)
    z <- forecastCov(model, data=eg1.DSE.data.diff)
    tfplot(z)



