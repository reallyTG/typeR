library(lubridate)


### Name: period
### Title: Create or parse period objects
### Aliases: period periods is.period seconds minutes hours days weeks
###   years milliseconds microseconds nanoseconds picoseconds
###   months.numeric
### Keywords: chron classes

### ** Examples


### Separate period and units vectors

period(c(90, 5), c("second", "minute"))
#  "5M 90S"
period(-1, "days")
period(c(3, 1, 2, 13, 1), c("second", "minute", "hour", "day", "week"))
period(c(1, -60), c("hour", "minute"))
period(0, "second")

### Units as arguments

period (second = 90, minute = 5)
period(day = -1)
period(second = 3, minute = 1, hour = 2, day = 13, week = 1)
period(hour = 1, minute = -60)
period(second = 0)
period(c(1, -60), c("hour", "minute"), hour = c(1, 2), minute = c(3, 4))

### Lubridate style parsing

period("2M 1sec")
period("2hours 2minutes 1second")
period("2d 2H 2M 2S")
period("2days 2hours 2mins 2secs")
period("2 days, 2 hours, 2 mins, 2 secs")
# Missing numerals default to 1. Repeated units are added up.
duration("day day")

### ISO 8601 parsing

period("P10M23DT23H") # M stands for months
period("10DT10M") # M stands for minutes
period("P3Y6M4DT12H30M5S") # M for both minutes and months
period("P23DT60H 20min 100 sec") # mixing ISO and lubridate style parsing

### Comparison with characters (from v1.6.0)

duration("day 2 sec") > "day 1sec"

### Elementary Constructors

x <- ymd("2009-08-03")
x + days(1) + hours(6) + minutes(30)
x + days(100) - hours(8)

class(as.Date("2009-08-09") + days(1)) # retains Date class
as.Date("2009-08-09") + hours(12)
class(as.Date("2009-08-09") + hours(12))
# converts to POSIXt class to accomodate time units

years(1) - months(7)
c(1:3) * hours(1)
hours(1:3)

# sequencing
y <- ymd(090101) # "2009-01-01 CST"
y + months(0:11)

# compare DST handling to durations
boundary <- ymd_hms("2009-03-08 01:59:59", tz="America/Chicago")
boundary + days(1) # period
boundary + ddays(1) # duration
is.period(as.Date("2009-08-03")) # FALSE
is.period(period(months= 1, days = 15)) # TRUE



