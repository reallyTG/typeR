library(data.table)


### Name: IDateTime
### Title: Integer based date class
### Aliases: IDate as.IDate ITime as.ITime IDateTime as.character.ITime
###   as.Date.IDate as.IDate.Date as.IDate.default as.ITime.character
###   as.ITime.default as.ITime.POSIXlt as.ITime.times as.list.IDate
###   as.POSIXct.IDate as.POSIXct.ITime as.POSIXlt.ITime c.IDate cut.IDate
###   format.ITime IDateTime.default mean.IDate print.ITime rep.IDate
###   rep.ITime round.IDate seq.IDate split.IDate second minute hour yday
###   wday mday week isoweek month quarter year IDate-class ITime-class
### Keywords: utilities

### ** Examples


# create IDate:
(d <- as.IDate("2001-01-01"))

# S4 coercion also works
identical(as.IDate("2001-01-01"), as("2001-01-01", "IDate"))

# create ITime:
(t <- as.ITime("10:45"))

# S4 coercion also works
identical(as.ITime("10:45"), as("10:45", "ITime"))

(t <- as.ITime("10:45:04"))

(t <- as.ITime("10:45:04", format = "%H:%M:%S"))

as.POSIXct("2001-01-01") + as.ITime("10:45")

datetime <- seq(as.POSIXct("2001-01-01"), as.POSIXct("2001-01-03"), by = "5 hour")
(af <- data.table(IDateTime(datetime), a = rep(1:2, 5), key = "a,idate,itime"))

af[, mean(a), by = "itime"]
af[, mean(a), by = list(hour = hour(itime))]
af[, mean(a), by = list(wday = factor(weekdays(idate)))]
af[, mean(a), by = list(wday = wday(idate))]

as.POSIXct(af$idate)
as.POSIXct(af$idate, time = af$itime)
as.POSIXct(af$idate, af$itime)
as.POSIXct(af$idate, time = af$itime, tz = "GMT")

as.POSIXct(af$itime, af$idate)
as.POSIXct(af$itime) # uses today's date

(seqdates <- seq(as.IDate("2001-01-01"), as.IDate("2001-08-03"), by = "3 weeks"))
round(seqdates, "months")




