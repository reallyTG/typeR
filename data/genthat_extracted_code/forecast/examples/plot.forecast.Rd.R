library(forecast)


### Name: plot.forecast
### Title: Forecast plot
### Aliases: plot.forecast autoplot.forecast autoplot.splineforecast
###   autolayer.forecast plot.splineforecast
### Keywords: ts

### ** Examples

library(ggplot2)

wine.fit <- hw(wineind,h=48)
plot(wine.fit)
autoplot(wine.fit)

fit <- tslm(wineind ~ fourier(wineind,4))
fcast <- forecast(fit, newdata=data.frame(fourier(wineind,4,20)))
autoplot(fcast)

fcast <- splinef(airmiles,h=5)
plot(fcast)
autoplot(fcast)




