library(timeDate)


### Name: as.timeDate
### Title: Any to 'timeDate' Coercion
### Aliases: 'Any to 'timeDate' Coercion' as.character.timeDate
###   as.double.timeDate as.list.timeDate as.data.frame.timeDate
###   as.POSIXct.timeDate as.POSIXlt.timeDate as.Date.timeDate as.timeDate
###   as.timeDate.default as.timeDate.POSIXt as.timeDate.Date
###   as.timeDate.timeDate coerce,ANY,timeDate-method
###   coerce,Date,timeDate-method coerce,POSIXt,timeDate-method
###   coerce,timeDate,character-method coerce,timeDate,numeric-method
###   coerce,timeDate,data.frame-method coerce,timeDate,list-method
###   coerce,timeDate,POSIXct-method coerce,timeDate,POSIXlt-method
###   coerce,timeDate,Date-method
### Keywords: chron

### ** Examples

## timeDate - 
   tC = timeCalendar()

## Convert 'timeDate' to a character strings:
   as.character(tC)
   
## Coerce a 'Date' object into a 'timeDate' object:
   as.timeDate(Sys.Date())



