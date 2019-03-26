library(gdata)


### Name: getYear
### Title: Get date/time parts from date and time objects
### Aliases: getDateTimeParts getYear getYear.default getYear.Date
###   getYear.POSIXct getYear.POSIXlt getMonth getMonth.default
###   getMonth.Date getMonth.POSIXct getMonth.POSIXlt getDay getDay.default
###   getDay.Date getDay.POSIXct getDay.POSIXlt getHour getHour.default
###   getMin getMin.default getSec getSec.default
### Keywords: manip misc

### ** Examples


## --- Date class ---

tmp <- Sys.Date()
tmp

getYear(tmp)
getMonth(tmp)
getDay(tmp)

## --- POSIXct class ---

tmp <- as.POSIXct(tmp)

getYear(tmp)
getMonth(tmp)
getDay(tmp)

## --- POSIXlt class ---

tmp <- as.POSIXlt(tmp)

getYear(tmp)
getMonth(tmp)
getDay(tmp)




