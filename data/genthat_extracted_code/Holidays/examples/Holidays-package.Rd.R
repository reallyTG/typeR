library(Holidays)


### Name: Holidays-package
### Title: Supplies holiday data to the TimeWarp package.
### Aliases: Holidays-package Holidays
### Keywords: package

### ** Examples

# View counts of registered holidays by year
sapply(as.character(1998:2012), function(y)
       sapply(allHolidays(), function(h) length(holidays(y, h, silent=TRUE))))



