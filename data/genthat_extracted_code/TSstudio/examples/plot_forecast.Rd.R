library(TSstudio)


### Name: plot_forecast
### Title: Plotting Forecast Object
### Aliases: plot_forecast

### ** Examples

data(USgas)
library(forecast)
fit <- ets(USgas)
fc<- forecast(fit, h = 60)
plot_forecast(fc)



