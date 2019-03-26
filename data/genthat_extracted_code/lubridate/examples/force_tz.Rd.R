library(lubridate)


### Name: force_tz
### Title: Replace time zone to create new date-time
### Aliases: force_tz force_tzs
### Keywords: chron manip

### ** Examples

x <- ymd_hms("2009-08-07 00:00:01", tz = "America/New_York")
force_tz(x, "UTC")
force_tz(x, "Europe/Amsterdam")

## DST skip:

y <- ymd_hms("2010-03-14 02:05:05 UTC")
force_tz(y, "America/New_York", roll=FALSE)
force_tz(y, "America/New_York", roll=TRUE)

## Heterogeneous time-zones:

x <- ymd_hms(c("2009-08-07 00:00:01", "2009-08-07 01:02:03"))
force_tzs(x, tzones = c("America/New_York", "Europe/Amsterdam"))
force_tzs(x, tzones = c("America/New_York", "Europe/Amsterdam"), tzone_out = "America/New_York")

x <- ymd_hms("2009-08-07 00:00:01")
force_tzs(x, tzones = c("America/New_York", "Europe/Amsterdam"))



