library(solartime)


### Name: computeIsDayByLocation
### Title: computeIsDayByLocation
### Aliases: computeIsDayByLocation

### ** Examples

dateSeq <- seq( as.POSIXct("2017-03-20", tz = "Etc/GMT-1")
                ,as.POSIXct("2017-03-21", tz = "Etc/GMT-1")
                , by = "30 min")
tmp <- computeIsDayByLocation(
  dateSeq, latDeg = 50.93, longDeg = 11.59, timeZone = 1)
plot( tmp ~ dateSeq )
yday <- as.POSIXlt(dateSeq[1])$yday + 1L
sunrise <- computeSunriseHourDoy(
  yday, latDeg = 50.93, longDeg = 11.59, timeZone = 1)
sunset <- computeSunsetHourDoy(
  yday, latDeg = 50.93, longDeg = 11.59, timeZone = 1)
abline( v = trunc(dateSeq[1], units = "days") + c(sunrise,sunset)*3600L )



