library(pastecs)


### Name: turnpoints
### Title: Analyze turning points (peaks or pits)
### Aliases: turnpoints extract.turnpoints lines.turnpoints plot.turnpoints
###   print.summary.turnpoints print.turnpoints summary.turnpoints
### Keywords: ts

### ** Examples

data(marbio)
plot(marbio[, "Nauplii"], type = "l")
# Calculate turning points for this series
Nauplii.tp <- turnpoints(marbio[, "Nauplii"])
summary(Nauplii.tp)
plot(Nauplii.tp)
# Add envelope and median line to original data
plot(marbio[, "Nauplii"], type = "l")
lines(Nauplii.tp)
# Note that lines() applies to the graph of original dataset
title("Raw data, envelope maxi., mini. and median lines")



