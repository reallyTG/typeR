library(forecastHybrid)


### Name: cvts
### Title: Cross validation for time series
### Aliases: cvts

### ** Examples

series <- subset(AirPassengers, end = 50)
cvmod1 <- cvts(series, FUN = snaive,
               windowSize = 25, maxHorizon = 12)
accuracy(cvmod1)

# We can also use custom model functions for modeling/forecasting
stlmClean <- function(x){stlm(tsclean(x))}
series <- subset(austres, end = 38)
cvmodCustom <- cvts(series, FUN = stlmClean, windowSize = 26, maxHorizon = 6)
accuracy(cvmodCustom)

# Use the rwf() function from the "forecast" package.
# This function does not have a modeling function and
# instead calculates a forecast on the time series directly
series <- subset(AirPassengers, end = 26)
rwcv <- cvts(series, FCFUN = rwf, windowSize = 24, maxHorizon = 1)

## Not run: 
##D cvmod2 <- cvts(USAccDeaths, FUN = ets,
##D                saveModels = FALSE, saveForecasts = FALSE,
##D                windowSize = 36, maxHorizon = 12)
##D 
##D # If we don't need prediction intervals and are using the nnetar model, turning off PI
##D # will make the forecasting much faster
##D cvmod3 <- cvts(AirPassengers, FUN = hybridModel,
##D                FCFUN = function(mod, h) forecast(mod, h = h, PI=FALSE),
##D                rolling = FALSE, windowSize = 48,
##D                maxHorizon = 12)
## End(Not run)




