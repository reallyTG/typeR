library(ggfortify)


### Name: autoplot.tsmodel
### Title: Autoplot time series models (like AR, ARIMA)
### Aliases: autoplot.tsmodel autoplot.ar autoplot.fracdiff autoplot.nnetar
###   autoplot.HoltWinters autoplot.fGARCH

### ** Examples

d.ar <- stats::ar(AirPassengers)
autoplot(d.ar)
autoplot(d.ar, predict = predict(d.ar, n.ahead = 5))
autoplot(stats::arima(UKgas), data = UKgas)
autoplot(forecast::arfima(AirPassengers))
autoplot(forecast::nnetar(UKgas), is.date = FALSE)

d.holt <- stats::HoltWinters(USAccDeaths)
autoplot(d.holt)
autoplot(d.holt, predict = predict(d.holt, n.ahead = 5))
autoplot(d.holt, predict = predict(d.holt, n.ahead = 5, prediction.interval = TRUE))



