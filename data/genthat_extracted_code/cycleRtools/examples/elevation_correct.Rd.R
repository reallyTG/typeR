library(cycleRtools)


### Name: elevation_correct
### Title: Generate reliable elevation data.
### Aliases: elevation_correct

### ** Examples

## Not run: 
##D data(ridedata)
##D 
##D ## When run the first time, geographical data will need to be downloaded.
##D ridedata$elevation.corrected <- elevation_correct(ridedata, "GBR")
##D 
##D ## A Bland-Altman-type plot.
##D difference <- ridedata$elevation.m - ridedata$elevation.corrected
##D plot(difference ~ ridedata$timer.min, cex = 0.2, ylab = "raw minus corrected")
##D m <- mean(difference, na.rm = TRUE); stdev <- sd(difference, na.rm = TRUE)
##D abline(h = c(m + c(-stdev, 0, stdev)), lty = c(1, 2, 1), col = "red")
## End(Not run)




