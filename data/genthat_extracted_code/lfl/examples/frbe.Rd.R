library(lfl)


### Name: frbe
### Title: Fuzzy Rule-Based Ensemble (FRBE) of time-series forecasts
### Aliases: frbe
### Keywords: models robust

### ** Examples

## Not run: 
##D   # prepare data (from the forecast package)
##D   library(forecast)
##D   horizon <- 10
##D   train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
##D   test <- wineind[(length(wineind)-horizon+1):length(wineind)]
##D 
##D   # perform FRBE
##D   f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)
##D 
##D   # evaluate FRBE forecasts
##D   evalfrbe(f, test)
##D 
##D   # display forecast results
##D   f$mean
## End(Not run)


