library(datetimeutils)


### Name: roundPOSIXt
### Title: Round POSIXt Objects to Specified Interval
### Aliases: roundPOSIXt
### Keywords: chron

### ** Examples

times <- as.POSIXct("2012-03-24 22:17:27") + 1:3
roundPOSIXt(times, "10 min")
roundPOSIXt(times, "10 min", TRUE)



