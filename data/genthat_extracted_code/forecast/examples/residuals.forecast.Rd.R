library(forecast)


### Name: residuals.forecast
### Title: Residuals for various time series models
### Aliases: residuals.forecast residuals.ar residuals.Arima residuals.bats
###   residuals.tbats residuals.ets residuals.fracdiff residuals.nnetar
###   residuals.stlm residuals.tslm
### Keywords: ts

### ** Examples

fit <- Arima(lynx,order=c(4,0,0), lambda=0.5)

plot(residuals(fit))
plot(residuals(fit, type='response'))



