library(TimeWarp)


### Name: holidays
### Title: TimeWarp Holiday Database
### Aliases: holidays addToHolidays registerHolidays unregisterHolidays
###   allHolidays isHoliday
### Keywords: utilities

### ** Examples

# Create a holiday type of New Year days for the 20th century.
registerHolidays('NEWYEAR', as.Date(ISOdate(1900:2000,1,1)))

# Return all New Year days for the 1990's
holidays(1990:2000,'NEWYEAR')

# View counts of registered holidays by year
sapply(as.character(1998:2012), function(y)
       sapply(allHolidays(), function(h) length(holidays(y, h, silent=TRUE))))




