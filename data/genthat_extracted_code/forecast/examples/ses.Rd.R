library(forecast)


### Name: ses
### Title: Exponential smoothing forecasts
### Aliases: ses holt hw
### Keywords: ts

### ** Examples


fcast <- holt(airmiles)
plot(fcast)
deaths.fcast <- hw(USAccDeaths,h=48)
plot(deaths.fcast)




