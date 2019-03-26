library(Smisc)


### Name: smartTimeAxis
### Title: Produces a time axis with smart spacing
### Aliases: smartTimeAxis
### Keywords: misc

### ** Examples

# Get data and set the options to the horizontal axis labels will be
# oriented vertically
data(timeData)
op <- par(las = 2, mfrow = c(3, 1), mar = c(4, 4, 2, 0.5))

# Make the default plot
plot(timeData, xlab = "", main = "Default intervals")

# Make the plot with specialized time axis
plot(timeData, axes = FALSE, frame.plot = TRUE, xlab = "", main = "10 minute intervals")

# Add y-axis
axis(2)

# Add the time axis
smartTimeAxis(timeData$time, nticks = 10)

# Only look at a small portion of the data with a different time format
par(mar = c(7, 4, 2, 0.5))

plot(timeData[200:237,], type = "b", axes = FALSE, frame.plot = TRUE,
     xlab = "", main = "15 second intervals")

axis(2)

smartTimeAxis(timeData[200:237,"time"], nticks = 20, time.format = "hh:mm:ss pm")

# Restore the original par settings
par(op)



