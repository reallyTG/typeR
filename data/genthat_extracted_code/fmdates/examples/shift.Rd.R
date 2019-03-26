library(fmdates)


### Name: shift
### Title: Shifting dates to good dates
### Aliases: shift

### ** Examples

library(lubridate)
ausy <- AUSYCalendar()
shift(ymd("20120229"), months(1), "u", ausy, FALSE)
shift(ymd("20120229"), months(1), "u", ausy, TRUE)



