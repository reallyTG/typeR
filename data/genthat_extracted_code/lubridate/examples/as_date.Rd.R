library(lubridate)


### Name: as_date
### Title: Convert an object to a date or date-time
### Aliases: as_date as_date,ANY-method as_date,POSIXt-method
###   as_date,numeric-method as_date,character-method as_datetime
###   as_datetime,POSIXt-method as_datetime,numeric-method
###   as_datetime,character-method as_datetime,ANY-method

### ** Examples

dt_utc <- ymd_hms("2010-08-03 00:50:50")
dt_europe <- ymd_hms("2010-08-03 00:50:50", tz="Europe/London")
c(as_date(dt_utc), as.Date(dt_utc))
c(as_date(dt_europe), as.Date(dt_europe))
## need not supply origin
as_date(10)



