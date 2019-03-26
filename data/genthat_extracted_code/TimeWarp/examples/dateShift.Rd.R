library(TimeWarp)


### Name: dateShift
### Title: Date shifting
### Aliases: dateShift
### Keywords: utilities

### ** Examples

dateShift("2007/12/06", by = "days", k.by = 7, direction = -1)
date <- as.Date("2009/1/1") + -5:5
dateShift(date, by = "days", silent = TRUE)
library(Holidays)
dateShift(date, by = "bizdays", k.by = 5, holidays = "NYSEC")
dateShift(date, by = "weeks", k.by = 2)
dateShift(date, by = "months", k.by = "3", direction = "-1")
dateShift(date, by = "years", k.by = 1, direction = 1)



