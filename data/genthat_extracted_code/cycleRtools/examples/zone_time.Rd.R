library(cycleRtools)


### Name: zone_time
### Title: Calculate time in zones.
### Aliases: zone_time

### ** Examples

data(ridedata)

## Time spent above and below critical power...
zone_time(ridedata, "power.W", zbounds = 300) / 60  # Minutes.

## Or with more zones...
zone_time(ridedata, "power.W", zbounds = c(100, 200, 300)) / 60

## Or given as a percentage...
zone_time(ridedata, "power.W", zbounds = c(100, 200, 300), pct = TRUE)




