library(dse)


### Name: featherForecasts
### Title: Multiple Horizon-Step Ahead Forecasts
### Aliases: featherForecasts featherForecasts.TSdata
###   featherForecasts.TSmodel featherForecasts.TSestModel
###   is.featherForecasts
### Keywords: ts

### ** Examples

data("egJofF.1dec93.data", package="dse")
model <- estVARXls(egJofF.1dec93.data)
pr <- featherForecasts(model, egJofF.1dec93.data)
tfplot(pr)



