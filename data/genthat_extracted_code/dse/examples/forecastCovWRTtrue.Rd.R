library(dse)


### Name: forecastCovWRTtrue
### Title: Compare Forecasts to True Model Output
### Aliases: forecastCovWRTtrue is.forecastCovWRTdata
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
true.model <- estVARXls(eg1.DSE.data.diff) # A starting model TSestModel
data <- simulate(true.model)
models <- list(TSmodel(estVARXar(data)),TSmodel(estVARXls(data)))
z <-  forecastCovWRTtrue( models, true.model)



