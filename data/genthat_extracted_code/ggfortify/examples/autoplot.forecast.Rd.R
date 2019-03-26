library(ggfortify)


### Name: autoplot.forecast
### Title: Autoplot 'forecast::forecast'
### Aliases: autoplot.forecast

### ** Examples

d.arima <- forecast::auto.arima(AirPassengers)
autoplot(forecast::forecast(d.arima, h = 10))
autoplot(forecast::forecast(d.arima, level = c(85), h = 10))
autoplot(forecast::forecast(d.arima, h = 5), conf.int = FALSE, is.date = FALSE)
autoplot(forecast::forecast(stats::HoltWinters(UKgas), h = 10))
## Not run: 
##D autoplot(forecast::forecast(forecast::ets(UKgas), h = 5))
## End(Not run)



