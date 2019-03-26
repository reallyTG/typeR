library(overlap)


### Name: overlapPlot
### Title: Plot overlapping kernel densities
### Aliases: overlapPlot

### ** Examples

# Get example data:
data(simulatedData)

# Do basic plot with defaults:
overlapPlot(pigObs, tigerObs)
# Make it prettier:
overlapPlot(tigerObs, pigObs, linet = c(1,1), linec = c("red", "blue"),
  rug=TRUE, extend="lightgreen", main="Simulated data")
legend("topleft", c("Tiger", "Pig"), lty=1, col=c("red", "blue"), bg="white")
# Add vertical dotted lines to mark sunrise (05:30) and sunset (18:47):
# (times must be in hours if the x-axis is labelled in hours)
abline(v=c(5.5, 18+47/60), lty=3)

# A plot centered on midnight:
overlapPlot(pigObs, tigerObs, xcenter = "m", rug=TRUE)
# Mark sunrise/sunset; values to the left of "00:00" are negative
# so subtract 24:
abline(v=c(5.5, (18+47/60) - 24), lty=3)




