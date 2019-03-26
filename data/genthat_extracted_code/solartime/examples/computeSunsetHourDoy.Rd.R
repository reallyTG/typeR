library(solartime)


### Name: computeSunsetHourDoy
### Title: computeSunsetHourDoy
### Aliases: computeSunsetHourDoy

### ** Examples

today <-
  as.POSIXlt(Sys.Date())$yday
(sunset <- computeSunsetHourDoy(today, latDeg = 51, isCorrectSolartime = FALSE))
(sunset <- computeSunsetHourDoy(today, latDeg = 51, longDeg = 11.586, timeZone = +1))
#
doy <- 1:366
plot( computeSunsetHourDoy(doy, latDeg = 51, isCorrectSolartime = FALSE) ~ doy )
# north pole: daylength 0 and 24 hours
plot( computeSunsetHourDoy( doy, latDeg = +80, isCorrectSolartime = FALSE) ~ doy )
plot( computeSunsetHourDoy( doy, latDeg = -80, isCorrectSolartime = FALSE) ~ doy )



