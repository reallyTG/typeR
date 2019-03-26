library(GeoLight)


### Name: getElevation
### Title: Calculate the appropriate sun elevation angle for known location
### Aliases: getElevation

### ** Examples

data(calib2)
  calib2$tFirst  <- as.POSIXct(calib2$tFirst, tz = "GMT")
  calib2$tSecond <- as.POSIXct(calib2$tSecond, tz = "GMT")
getElevation(calib2, known.coord = c(7.1,46.3), lnorm.pars = TRUE)



