library(lubridate)


### Name: as.interval
### Title: Change an object to an 'interval'
### Aliases: as.interval as.interval,numeric-method
###   as.interval,difftime-method as.interval,Interval-method
###   as.interval,Duration-method as.interval,Period-method
###   as.interval,POSIXt-method as.interval,logical-method
### Keywords: chron classes manip methods

### ** Examples

diff <- make_difftime(days = 31) #difftime
as.interval(diff, ymd("2009-01-01"))
as.interval(diff, ymd("2009-02-01"))

dur <- duration(days = 31) #duration
as.interval(dur, ymd("2009-01-01"))
as.interval(dur, ymd("2009-02-01"))

per <- period(months = 1) #period
as.interval(per, ymd("2009-01-01"))
as.interval(per, ymd("2009-02-01"))

as.interval(3600, ymd("2009-01-01")) #numeric



