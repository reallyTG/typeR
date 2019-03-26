library(seasonal)


### Name: update.seas
### Title: Update and Re-evaluate a Seasonal Adjustment Model
### Aliases: update.seas

### ** Examples

## Not run: 
##D # updating the call
##D m <- seas(AirPassengers)
##D update(m, x11 = "")
##D update(m, x = sqrt(AirPassengers), x11 = "")
##D 
##D # 'update' can be also used with lapply (or mapply)
##D 
##D # a list of time series
##D dta <- list(fdeaths = fdeaths, mdeaths = mdeaths)
##D 
##D # use 'seas' via lapply
##D ll <- lapply(dta, seas, x11 = "")
##D 
##D # use 'update' via lapply
##D lapply(ll, update, arima.model = c(0, 1, 1, 0, 1, 1))
## End(Not run)



