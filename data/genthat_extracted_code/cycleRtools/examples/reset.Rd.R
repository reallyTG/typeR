library(cycleRtools)


### Name: reset
### Title: Reset a dataset or vector.
### Aliases: reset

### ** Examples

data(ridedata)

# Remove first minute of data and reset.
data_raw   <- ridedata[ridedata$timer.s > 60, ]
data_reset <- reset(data_raw)




