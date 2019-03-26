library(ggfortify)


### Name: fortify.tsmodel
### Title: Convert time series models (like AR, ARIMA) to 'data.frame'
### Aliases: fortify.tsmodel fortify.ar fortify.Arima fortify.fracdiff
###   fortify.nnetar fortify.HoltWinters fortify.fGARCH

### ** Examples

fortify(stats::ar(AirPassengers))
fortify(stats::arima(UKgas))
fortify(stats::arima(UKgas), data = UKgas, is.date = TRUE)
fortify(forecast::auto.arima(austres))
fortify(forecast::arfima(AirPassengers))
fortify(forecast::nnetar(UKgas))
fortify(stats::HoltWinters(USAccDeaths))

data(LPP2005REC, package = 'timeSeries')
x = timeSeries::as.timeSeries(LPP2005REC)
d.Garch = fGarch::garchFit(LPP40 ~ garch(1, 1), data = 100 * x, trace = FALSE)
fortify(d.Garch)



