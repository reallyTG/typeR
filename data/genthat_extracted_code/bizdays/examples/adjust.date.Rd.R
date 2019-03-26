library(bizdays)


### Name: adjust.date
### Title: Adjusts the given dates to the next/previous business day
### Aliases: adjust.date adjust.next following adjust.none
###   modified.following adjust.previous preceding modified.preceding

### ** Examples

cal <- create.calendar("Brazil/ANBIMA", holidaysANBIMA, weekdays=c("saturday", "sunday"))
adjust.next("2013-01-01", "Brazil/ANBIMA")
following("2013-01-01", cal)
modified.following("2016-01-31", cal)
adjust.previous("2013-01-01", cal)
preceding("2013-01-01", cal)
modified.preceding("2016-01-01", cal)



