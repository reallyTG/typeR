library(lubridate)


### Name: %m+%
### Title: Add and subtract months to a date without exceeding the last day
###   of the new month
### Aliases: %m+% m+ m- %m-% %m+%,ANY,ANY-method %m-%,ANY,ANY-method
###   %m+%,Period,ANY-method %m+%,ANY,Period-method %m-%,Period,ANY-method
###   %m-%,ANY,Period-method %m+%,Duration,ANY-method
###   %m+%,ANY,Duration-method %m-%,Duration,ANY-method
###   %m-%,ANY,Duration-method %m+%,Interval,ANY-method
###   %m+%,ANY,Interval-method %m-%,Interval,ANY-method
###   %m-%,ANY,Interval-method add_with_rollback

### ** Examples

jan <- ymd_hms("2010-01-31 03:04:05")
jan + months(1:3) # Feb 31 and April 31 returned as NA
# NA "2010-03-31 03:04:05 UTC" NA
jan %m+% months(1:3) # No rollover

leap <- ymd("2012-02-29")
"2012-02-29 UTC"
leap %m+% years(1)
leap %m+% years(-1)
leap %m-% years(1)



