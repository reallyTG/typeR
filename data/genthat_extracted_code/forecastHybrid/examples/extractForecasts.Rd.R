library(forecastHybrid)


### Name: extractForecasts
### Title: Extract cross validated rolling forecasts
### Aliases: extractForecasts

### ** Examples

cv <- cvts(AirPassengers, FUN = stlm, FCFUN = forecast,
        rolling = TRUE, windowSize = 134, horizon = 2)

extractForecasts(cv)




