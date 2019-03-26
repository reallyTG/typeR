library(cycleRtools)


### Name: rollmean_
### Title: Rolling average smoothing.
### Aliases: rollmean_ rollmean_smth

### ** Examples

## Not run: 
##D data(ridedata)
##D 
##D ## Smooth power data with a 30 second moving average.
##D rollmean_smth(ridedata, power.W, 30)
##D 
##D ## Or use an exponentially weighted moving average.
##D rollmean_smth(ridedata, power.W, 30, ema = TRUE)
## End(Not run)



