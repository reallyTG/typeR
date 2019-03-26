library(REddyProc)


### Name: getTZone
### Title: getTZone
### Aliases: getTZone

### ** Examples

getTZone(as.POSIXct("2010-07-01 16:00:00", tz = "etc/GMT-1") )
getTZone(as.POSIXct("2010-07-01 16:00:00") )
# printed with local time zone, but actually has no tz attribute
getTZone(Sys.time())



