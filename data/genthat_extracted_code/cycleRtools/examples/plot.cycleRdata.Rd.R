library(cycleRtools)


### Name: plot.cycleRdata
### Title: Plot cycling data.
### Aliases: plot.cycleRdata

### ** Examples

## Not run: 
##D data(ridedata)
##D 
##D plot(ridedata, xvar = "timer.min")
##D plot(ridedata, xvar = "distance.km")
##D 
##D ## With only two plots.
##D plot(ridedata, y = c(2, 1))
##D 
##D ## Using xlim, note that title metrics adjust.
##D plot(ridedata, xvar = "timer.min", xlim = c(100, 150))
##D 
##D ## Lap colouring.
##D data(intervaldata)
##D plot(intervaldata, xvar = "timer.min", laps = TRUE)
## End(Not run)




