library(forecast)


### Name: fitted.fracdiff
### Title: h-step in-sample forecasts for time series models.
### Aliases: fitted.fracdiff fitted.Arima fitted.ar fitted.bats fitted.ets
###   fitted.modelAR fitted.nnetar fitted.tbats
### Keywords: ts

### ** Examples

fit <- ets(WWWusage)
plot(WWWusage)
lines(fitted(fit), col='red')
lines(fitted(fit, h=2), col='green')
lines(fitted(fit, h=3), col='blue')
legend("topleft", legend=paste("h =",1:3), col=2:4, lty=1)




