library(forecast)


### Name: auto.arima
### Title: Fit best ARIMA model to univariate time series
### Aliases: auto.arima
### Keywords: ts

### ** Examples

fit <- auto.arima(WWWusage)
plot(forecast(fit,h=20))




