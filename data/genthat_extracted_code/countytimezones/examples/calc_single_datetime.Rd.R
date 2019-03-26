library(countytimezones)


### Name: calc_single_datetime
### Title: Convert UTC to local time for a single observation
### Aliases: calc_single_datetime

### ** Examples

utc_time <- as.POSIXct("1999-09-15 14:30:00", tz = "UTC")
local_time <- calc_single_datetime(utc_time, tz = "US/Eastern")




