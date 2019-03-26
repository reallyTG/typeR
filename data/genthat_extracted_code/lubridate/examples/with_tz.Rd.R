library(lubridate)


### Name: with_tz
### Title: Get date-time in a different time zone
### Aliases: with_tz
### Keywords: chron manip

### ** Examples

x <- ymd_hms("2009-08-07 00:00:01", tz = "America/New_York")
with_tz(x, "GMT")



