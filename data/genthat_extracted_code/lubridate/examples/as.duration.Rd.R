library(lubridate)


### Name: as.duration
### Title: Change an object to a duration
### Aliases: as.duration as.duration,numeric-method
###   as.duration,logical-method as.duration,difftime-method
###   as.duration,Interval-method as.duration,Duration-method
###   as.duration,Period-method as.duration,character-method
### Keywords: chron classes manip methods

### ** Examples

span <- interval(ymd("2009-01-01"), ymd("2009-08-01")) #interval
as.duration(span)
as.duration(10) # numeric
dur <- duration(hours = 10, minutes = 6)
as.numeric(dur, "hours")
as.numeric(dur, "minutes")




