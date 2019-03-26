library(ftsa)


### Name: farforecast
### Title: Functional data forecasting through functional principal
###   component autoregression
### Aliases: farforecast
### Keywords: models

### ** Examples

sqrt_pm10 = sqrt(pm_10_GR$y)
x = seq(0,23.5, by=.5)
uni_forecast_sqrt_pm10 = forecast(ftsm(fts(x, sqrt_pm10)), h=30, method="arima")
multi_forecast_sqrt_pm10 = farforecast(ftsm(fts(x,sqrt_pm10)), h=30)
par(mfrow=c(1,2))
plot(uni_forecast_sqrt_pm10, ylim=c(5.2,7.5))
plot(multi_forecast_sqrt_pm10, ylim=c(5.2,7.5))



