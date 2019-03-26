library(mondate)


### Name: Coersion-from-mondate methods
### Title: Coersion Methods for Mondates
### Aliases: as.character.mondate as.numeric,mondate-method as.Date.mondate
###   as.POSIXct.mondate as.POSIXlt.mondate
### Keywords: methods chron

### ** Examples

(b<-mondate(1))              # end of first month of current millennium
as.numeric(b)                # 1
as.character(b)              # December 31, 2000 in date format of locale
as.character(b, format="%b-%Y")  # "Dec-2000"
as.numeric(b, convert=TRUE, timeunits="years") # converts to 1/12 "years"
(b<-mondate(1, timeunits="days")) # end of first day of millennium
as.numeric(b)                # 1/31
as.numeric(b, convert=TRUE)  # 1 (with a "days" attribute)
as.Date(b)                   # displays as "2000-01-31"
as.POSIXct(b)                # displays as "2000-01-31 UTC"
weekdays(as.POSIXct(b))      # January 31, 2000 was a "Saturday" (in English)
as.POSIXlt(b)$hour           # zero, as are ...$min and ...$sec



