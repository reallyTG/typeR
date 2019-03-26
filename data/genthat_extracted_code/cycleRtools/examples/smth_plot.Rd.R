library(cycleRtools)


### Name: smth_plot
### Title: Smoothed data plot.
### Aliases: smth_plot

### ** Examples

data(ridedata)

## Plot with a single blue line (default arguments):
smth_plot(ridedata, colour = "blue", main = "Single Colour",
          xlab = "Time (seconds)", ylab = "Power (watts)")

## Create some laps.
ridedata$lap <- ceiling(seq(from = 1.1, to = 5, length.out = nrow(ridedata)))
## Plot with lap colours.
smth_plot(ridedata, timer.min, power.W, power.smooth.W, colour = "lap",
          xlab = "Time (mins)", ylab = "Power (watts)", main = "Lap Colours")




