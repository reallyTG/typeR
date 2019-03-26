library(forecast)


### Name: forecast.fracdiff
### Title: Forecasting using ARIMA or ARFIMA models
### Aliases: forecast.fracdiff forecast.Arima forecast.ar
### Keywords: ts

### ** Examples

fit <- Arima(WWWusage,c(3,1,0))
plot(forecast(fit))

library(fracdiff)
x <- fracdiff.sim( 100, ma=-.4, d=.3)$series
fit <- arfima(x)
plot(forecast(fit,h=30))




