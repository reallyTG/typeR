library(cycleRtools)


### Name: zone_index
### Title: Index zones.
### Aliases: zone_index

### ** Examples

data(ridedata)

## Best used to append to existing data.
ridedata$zone <- zone_index(ridedata$power.W, c(100, 200, 300))

## How much distance was covered in each zone?
ridedata$delta.dist <- c(0, diff(ridedata$distance.km))
with(ridedata, tapply(delta.dist, zone, sum, na.rm = TRUE))  # Km.




