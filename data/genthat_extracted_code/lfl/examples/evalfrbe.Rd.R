library(lfl)


### Name: evalfrbe
### Title: Evaluate the performance of the FRBE forecast
### Aliases: evalfrbe
### Keywords: models robust

### ** Examples

## Not run: 
##D   # prepare data (from the forecast package)
##D   library(forecast)
##D   horizon <- 10
##D   train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
##D   test <- wineind[(length(wineind)-horizon+1):length(wineind)]
##D   f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)
##D   evalfrbe(f, test)
## End(Not run)


