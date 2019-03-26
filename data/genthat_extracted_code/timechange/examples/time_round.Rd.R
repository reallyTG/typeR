library(timechange)


### Name: time_round
### Title: Round, floor and ceiling for date-time objects
### Aliases: time_round time_round time_floor time_round time_ceiling

### ** Examples


## print fractional seconds
options(digits.secs=6)

x <- as.POSIXct("2009-08-03 12:01:59.23")
time_round(x, ".5 asec")
time_round(x, "sec")
time_round(x, "second")
time_round(x, "asecond")
time_round(x, "minute")
time_round(x, "5 mins")
time_round(x, "5M") # "M" for minute "m" for month
time_round(x, "hour")
time_round(x, "2 hours")
time_round(x, "2H")
time_round(x, "day")
time_round(x, "week")
time_round(x, "month")
time_round(x, "bimonth")
time_round(x, "quarter") == time_round(x, "3 months")
time_round(x, "halfyear")
time_round(x, "year")

x <- as.POSIXct("2009-08-03 12:01:59.23")
time_floor(x, ".1 asec")
time_floor(x, "second")
time_floor(x, "minute")
time_floor(x, "M")
time_floor(x, "hour")
time_floor(x, "day")
time_floor(x, "week")
time_floor(x, "m")
time_floor(x, "month")
time_floor(x, "bimonth")
time_floor(x, "quarter")
time_floor(x, "season")
time_floor(x, "halfyear")
time_floor(x, "year")

x <- as.POSIXct("2009-08-03 12:01:59.23")
time_ceiling(x, ".1 asec")
time_ceiling(x, "second")
time_ceiling(x, "minute")
time_ceiling(x, "5 mins")
time_ceiling(x, "hour")
time_ceiling(x, "day")
time_ceiling(x, "week")
time_ceiling(x, "month")
time_ceiling(x, "bimonth") == time_ceiling(x, "2 months")
time_ceiling(x, "quarter")
time_ceiling(x, "season")
time_ceiling(x, "halfyear")
time_ceiling(x, "year")

## behavior on the boundary
x <- as.Date("2000-01-01")
time_ceiling(x, "month")
time_ceiling(x, "month", change_on_boundary = FALSE)

## As of R 3.4.2 POSIXct printing of fractional numbers is wrong
as.POSIXct("2009-08-03 12:01:59.3", tz = "UTC") ## -> "2009-08-03 12:01:59.2 UTC"
time_ceiling(x, ".1 asec") ## -> "2009-08-03 12:01:59.2 UTC"

## Civil Time vs Absolute Time Rounding

# "2014-11-02 01:59:59.5 EDT" before 1h backroll at 2AM
x <- .POSIXct(1414907999.5, tz = "America/New_York")
x
time_ceiling(x, "hour") # "2014-11-02 02:00:00 EST"
time_ceiling(x, "minute")
time_ceiling(x, "sec")
difftime(time_ceiling(x, "s"), x)
time_ceiling(x, "1a") # "2014-11-02 01:00:00 EST"
difftime(time_ceiling(x, "a"), x)

# "2014-11-02 01:00:00.5 EST" after 1h backroll at 2AM
x <- .POSIXct(1414908000.5, tz = "America/New_York")
x
time_floor(x, "hour") # "2014-11-02 01:00:00 EST"
difftime(time_floor(x, "hour"), x)
time_floor(x, "3600a") # "2014-11-02 01:00:00 EST"  - 25m
difftime(time_floor(x, "a"), x)



