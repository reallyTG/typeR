library(lubridate)


### Name: duration
### Title: Create a duration object.
### Aliases: duration dseconds dminutes dhours ddays dweeks dyears
###   dmilliseconds dmicroseconds dnanoseconds dpicoseconds is.duration
### Keywords: chron classes

### ** Examples


### Separate period and units vectors

duration(90, "seconds")
duration(1.5, "minutes")
duration(-1, "days")

### Units as arguments

duration(day = -1)
duration(second = 90)
duration(minute = 1.5)
duration(mins = 1.5)
duration(second = 3, minute = 1.5, hour = 2, day = 6, week = 1)
duration(hour = 1, minute = -60)

### Parsing

duration("2M 1sec")
duration("2hours 2minutes 1second")
duration("2d 2H 2M 2S")
duration("2days 2hours 2mins 2secs")
# Missing numerals default to 1. Repeated units are added up.
duration("day day")

### ISO 8601 parsing

duration("P3Y6M4DT12H30M5S")
duration("P23DT23H") # M stands for months
duration("10DT10M") # M stands for minutes
duration("P23DT60H 20min 100 sec") # mixing ISO and lubridate style parsing

# Comparison with characters (from v1.6.0)

duration("day 2 sec") > "day 1sec"


## ELEMENTARY CONSTRUCTORS:

dseconds(1)
dminutes(3.5)

x <- ymd_hms("2009-08-03", tz="America/Chicago")
x + ddays(1) + dhours(6) + dminutes(30)
x + ddays(100) - dhours(8)

class(as.Date("2009-08-09") + ddays(1)) # retains Date class
as.Date("2009-08-09") + dhours(12)
class(as.Date("2009-08-09") + dhours(12))
# converts to POSIXt class to accomodate time units

dweeks(1) - ddays(7)
c(1:3) * dhours(1)

# compare DST handling to durations
boundary <- ymd_hms("2009-03-08 01:59:59", tz="America/Chicago")
boundary + days(1) # period
boundary + ddays(1) # duration
is.duration(as.Date("2009-08-03")) # FALSE
is.duration(duration(days = 12.4)) # TRUE



