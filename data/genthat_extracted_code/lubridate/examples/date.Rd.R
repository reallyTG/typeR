library(lubridate)


### Name: date
### Title: Get/set date component of a date-time
### Aliases: date date<-
### Keywords: chron manip methods utilities

### ** Examples

x <- ymd_hms("2012-03-26 23:12:13", tz = "America/New_York")
date(x)
as.Date(x) # by default as.Date assumes you want to know the date in UTC
as.Date(x, tz = "America/New_York")
date(x) <- as.Date("2000-01-02")
x



