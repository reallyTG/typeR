library(dse)


### Name: forecasts
### Title: Extract Forecasts
### Aliases: forecasts forecasts.forecast forecasts.featherForecasts
###   forecasts.horizonForecasts
### Keywords: ts

### ** Examples

    data("egJofF.1dec93.data", package="dse")
    model <- estVARXls(window(egJofF.1dec93.data, end=c(1985,12)))
    pr <- forecast(model, conditioning.inputs=inputData(egJofF.1dec93.data))
    z <- forecasts(pr)



