library(solartime)


### Name: computeDayLengthDoy
### Title: computeDayLengthDoy
### Aliases: computeDayLengthDoy

### ** Examples

doy <- 1:366
plot( computeDayLengthDoy(doy, latDeg = 51) ~ doy)
# north pole: daylength 0 and 24 hours
plot( computeDayLengthDoy( doy, latDeg = +80) ~ doy )
plot( computeDayLengthDoy( doy, latDeg = -80) ~ doy )



