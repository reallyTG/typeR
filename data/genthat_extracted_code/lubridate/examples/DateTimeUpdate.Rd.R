library(lubridate)


### Name: DateTimeUpdate
### Title: Changes the components of a date object
### Aliases: DateTimeUpdate update.POSIXt
### Keywords: chron manip

### ** Examples

date <- ymd("2009-02-10")
update(date, year = 2010, month = 1, mday = 1)

update(date, year =2010, month = 13, mday = 1)

update(date, minute = 10, second = 3)



