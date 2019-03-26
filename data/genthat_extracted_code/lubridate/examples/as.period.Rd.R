library(lubridate)


### Name: as.period
### Title: Change an object to a period
### Aliases: as.period as.period,numeric-method as.period,difftime-method
###   as.period,Interval-method as.period,Duration-method
###   as.period,Period-method as.period,logical-method
###   as.period,character-method
### Keywords: chron classes manip methods

### ** Examples

span <- interval(ymd_hms("2009-01-01 00:00:00"), ymd_hms("2010-02-02 01:01:01")) #interval
as.period(span)
as.period(span, unit = "day")
"397d 1H 1M 1S"
leap <- interval(ymd("2016-01-01"), ymd("2017-01-01"))
as.period(leap, unit = "days")
as.period(leap, unit = "years")
dst <- interval(ymd("2016-11-06", tz = "America/Chicago"),
ymd("2016-11-07", tz = "America/Chicago"))
# as.period(dst, unit = "seconds")
as.period(dst, unit = "hours")
per <- period(hours = 10, minutes = 6)
as.numeric(per, "hours")
as.numeric(per, "minutes")




