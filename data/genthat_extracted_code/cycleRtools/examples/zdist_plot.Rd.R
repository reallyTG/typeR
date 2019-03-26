library(cycleRtools)


### Name: zdist_plot
### Title: Zone-time distribution plot.
### Aliases: zdist_plot

### ** Examples

data(ridedata)

## Using power.
zdist_plot(
 data = ridedata, column = power.W,
 binwidth = 10,  # 10 watt bins.
 zbounds = c(100, 200, 300),
 xlim = c(110, 500), xlab = "Power (Watts)",
 main = "Power distribution" # Argument passed to barplot.
)

## Using speed.
zdist_plot(
  data = ridedata, column = speed.kmh,
  binwidth = 2,  # 2 km/hr bins.
  zbounds = c(10, 20, 30),
  xlab = "Speed (km/hr)",
  main = "Speed distribution"
)

## Without zone colouring (produces a warning).
zdist_plot(
  data = ridedata, column = speed.kmh,
  binwidth = 5,  # 2 km/hr bins.
  xlab = "Speed (km/hr)", main = "Dull"
)




