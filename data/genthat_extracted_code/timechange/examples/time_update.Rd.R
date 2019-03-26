library(timechange)


### Name: time_update
### Title: Update components of a date-time object
### Aliases: time_update

### ** Examples

date <- as.Date("2009-02-10")
time_update(date, year = 2010, month = 1, mday = 1)
time_update(date, year = 2010, month = 13, mday = 1)
time_update(date, minute = 10, second = 3)
time_update(date, minute = 10, second = 3, tz = "America/New_York")



