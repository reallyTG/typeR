library(ggfortify)


### Name: fortify.forecast
### Title: Convert 'forecast::forecast' to 'data.frame'
### Aliases: fortify.forecast

### ** Examples

d.arima <- forecast::auto.arima(AirPassengers)
d.forecast <- forecast::forecast(d.arima, level = c(95), h = 50)
fortify(d.forecast)
fortify(d.forecast, ts.connect = TRUE)



