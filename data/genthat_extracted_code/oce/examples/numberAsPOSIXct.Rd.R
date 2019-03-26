library(oce)


### Name: numberAsPOSIXct
### Title: Convert a Numeric Time to a POSIXct Time
### Aliases: numberAsPOSIXct

### ** Examples


numberAsPOSIXct(0)                     # unix time 0
numberAsPOSIXct(1, type="matlab")      # matlab time 1
numberAsPOSIXct(cbind(566, 345615), type="gps") # Canada Day, zero hour UTC
numberAsPOSIXct(cbind(2013, 0), type="yearday") # start of 2013

## Epic time, one hour into Canada Day of year 2018. In computing the
## Julian day, note that this starts at noon.
jd <- julianDay(as.POSIXct("2018-07-01 12:00:00", tz="UTC"))
numberAsPOSIXct(cbind(jd, 1e3 * 1 * 3600), type="epic", tz="UTC")




