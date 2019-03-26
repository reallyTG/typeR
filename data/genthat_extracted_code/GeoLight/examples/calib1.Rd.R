library(GeoLight)


### Name: calib1
### Title: Example data for calibration: Light intensities and twilight
###   events
### Aliases: calib calib1 calib2

### ** Examples

data(calib2)
 calib2$tFirst <- as.POSIXct(calib2$tFirst, tz = "GMT")
 calib2$tSecond <- as.POSIXct(calib2$tSecond, tz = "GMT")
getElevation(calib2, known.coord = c(8,47.01))



