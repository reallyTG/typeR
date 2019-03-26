library(dse)


### Name: forecast
### Title: Forecast Multiple Steps Ahead
### Aliases: forecast forecast.TSdata forecast.TSmodel forecast.TSestModel
###   is.forecast
### Keywords: ts

### ** Examples

    data("egJofF.1dec93.data", package="dse")
    model <- estVARXls(window(egJofF.1dec93.data, end=c(1985,12)))
    pr <- forecast(model, conditioning.inputs=inputData(egJofF.1dec93.data))
    #tfplot(pr) Rbug 0.90.1
    is.forecast(pr)



