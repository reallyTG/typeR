library(datetimeutils)


### Name: timegrid
### Title: POSIXct Time Grid
### Aliases: timegrid

### ** Examples

from <- as.POSIXct("2012-04-30 08:00:00")
to   <- as.POSIXct("2012-05-04 22:00:00")
timegrid(from, to, interval = "1 hour",
         holidays = as.Date("2012-05-01"))


timegrid(as.POSIXct("2017-06-23 21:00:00"), ## system timezone
         as.POSIXct("2017-06-26 10:00:00"),
         interval = "15 min")
timegrid(as.POSIXlt("2017-06-23 21:00:00", tz = "UTC"),
         as.POSIXlt("2017-06-26 10:00:00", tz = "UTC"),
         interval = "15 min")



