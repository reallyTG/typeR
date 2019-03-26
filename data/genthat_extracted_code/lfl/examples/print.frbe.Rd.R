library(lfl)


### Name: print.frbe
### Title: Print an instance of the 'frbe' class
### Aliases: print.frbe
### Keywords: models robust

### ** Examples

## Not run: 
##D   # prepare data (from the forecast package)
##D   library(forecast)
##D   horizon <- 10
##D   train <- wineind[-1 * (length(wineind)-horizon+1):length(wineind)]
##D   test <- wineind[(length(wineind)-horizon+1):length(wineind)]
##D   f <- frbe(ts(train, frequency=frequency(wineind)), h=horizon)
##D   print(f)
##D   print(test)
## End(Not run)


