library(lubridate)


### Name: round_date
### Title: Round, floor and ceiling methods for date-time objects
### Aliases: round_date floor_date ceiling_date
### Keywords: chron manip

### ** Examples


## print fractional seconds
options(digits.secs=6)

x <- ymd_hms("2009-08-03 12:01:59.23")
round_date(x, ".5s")
round_date(x, "sec")
round_date(x, "second")
round_date(x, "minute")
round_date(x, "5 mins")
round_date(x, "hour")
round_date(x, "2 hours")
round_date(x, "day")
round_date(x, "week")
round_date(x, "month")
round_date(x, "bimonth")
round_date(x, "quarter") == round_date(x, "3 months")
round_date(x, "halfyear")
round_date(x, "year")

x <- ymd_hms("2009-08-03 12:01:59.23")
floor_date(x, ".1s")
floor_date(x, "second")
floor_date(x, "minute")
floor_date(x, "hour")
floor_date(x, "day")
floor_date(x, "week")
floor_date(x, "month")
floor_date(x, "bimonth")
floor_date(x, "quarter")
floor_date(x, "season")
floor_date(x, "halfyear")
floor_date(x, "year")

x <- ymd_hms("2009-08-03 12:01:59.23")
ceiling_date(x, ".1 sec") # imprecise representation at 0.1 sec !!!
ceiling_date(x, "second")
ceiling_date(x, "minute")
ceiling_date(x, "5 mins")
ceiling_date(x, "hour")
ceiling_date(x, "day")
ceiling_date(x, "week")
ceiling_date(x, "month")
ceiling_date(x, "bimonth") == ceiling_date(x, "2 months")
ceiling_date(x, "quarter")
ceiling_date(x, "season")
ceiling_date(x, "halfyear")
ceiling_date(x, "year")

## As of R 3.4.2 POSIXct printing of fractional numbers is wrong
as.POSIXct("2009-08-03 12:01:59.3") ## -> "2009-08-03 12:01:59.2 CEST"
ceiling_date(x, ".1 sec") ## -> "2009-08-03 12:01:59.2 CEST"

x <- ymd("2000-01-01")
ceiling_date(x, "month")
ceiling_date(x, "month", change_on_boundary = TRUE)



