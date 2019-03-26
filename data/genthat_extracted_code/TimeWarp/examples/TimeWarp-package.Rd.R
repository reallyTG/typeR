library(TimeWarp)


### Name: TimeWarp-package
### Title: Date sequence and manipulation with business days and holidays.
### Aliases: TimeWarp-package TimeWarp
### Keywords: package

### ** Examples

library(Holidays)
# View counts of registered holidays by year
sapply(as.character(1998:2012), function(y)
       sapply(allHolidays(), function(h) length(holidays(y, h, silent=TRUE))))

# Find US option expiration dates in 2011 (The pricing day, usually a Friday)

# Technically speaking, standardized options expire on the Saturday
# following the third Friday of the month. The reason that equity and
# index options expire on this day is due to the fact that this day offers
# the least number of scheduling conflicts, i.e. holidays.

# When an options expiration date falls on a holiday, all trading dates
# are moved earlier. For example, in 2008, options expiration date falls
# on Good Friday. In this situation, options will still expire on
# Saturday following Good Friday -- however the last trading day for
# Equity options will be the Thursday preceding the Good Friday trading
# holiday.

yy <- 2011
(d1 <- dateSeq(paste(yy, '-01-01', sep=''), len=12, by='months'))
(d2 <- dateAlign(d1, by='months', dir=-1))
(d3 <- dateAlign(d2, by='weeks', week.align=5))
(d4 <- dateWarp(d3, 14, by='days'))
(d5 <- dateAlign(d4, by='bizdays@NYSEC', dir=-1))

# Find option expiration dates that have been shifted because they would have
# occured on a holiday
yy <- 1990
d1 <- dateSeq(paste(yy, '-01-01', sep=''), len=288, by='months')
d2 <- dateAlign(d1, by='months', dir=-1)
d3 <- dateAlign(d2, by='weeks', week.align=5)
d4 <- dateWarp(d3, 14, by='days')
d5 <- dateAlign(d4, by='bizdays@NYSEC', dir=-1)
data.frame(holiday=d4, option.expiration=d5)[which(d4 != d5), ]



