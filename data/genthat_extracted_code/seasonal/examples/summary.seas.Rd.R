library(seasonal)


### Name: summary.seas
### Title: Summary of a X13-ARIMA-SEATS seasonal adjustment
### Aliases: summary.seas print.summary.seas

### ** Examples

## Not run: 
##D m <- seas(AirPassengers)
##D summary(m)  
##D 
##D ### user defined stats from the udg function 
##D # (experimental, see ?udg)
##D 
##D # also show some M quality statistics for X11 in summary
##D options(seas.stats = c("f3.m01", "f3.m02", "f3.m03", "f3.m04"))
##D summary(seas(AirPassengers, x11 = ""))
##D 
##D # this does not affect the SEATS output
##D summary(seas(AirPassengers))
##D 
##D # reset to default
##D options(seas.stats = NULL)
## End(Not run)



