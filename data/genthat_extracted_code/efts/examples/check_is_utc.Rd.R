library(efts)


### Name: check_is_utc
### Title: Check that a date-time is in the UTC time zone, and return the
###   date time offset 'zero'
### Aliases: check_is_utc

### ** Examples

start_time <- ISOdate(year=2010, month=08, day=01, hour = 12, min = 0, sec = 0, tz = 'UTC')
check_is_utc(d=start_time)




