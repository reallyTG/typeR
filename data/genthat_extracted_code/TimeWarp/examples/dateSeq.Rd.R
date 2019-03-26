library(TimeWarp)


### Name: dateSeq
### Title: Create a sequence of Dates
### Aliases: dateSeq
### Keywords: utilities

### ** Examples

dateSeq("2008-12-20", "2009-1-10")
dateSeq("2008-12-20", "2009-1-10", by = "days", k.by = 2)
library(Holidays)
dateSeq("2008-12-20", "2009-1-10", by = "bizdays", holidays = "NYSEC")
dateSeq(from = "1960-01-01", to = "1960-01-20", by = "weeks", week.align
= 0, extend = TRUE)
dateSeq(from = "2000/01/14", length.out = 5, by = "bizdays", holidays = 'NYSEC')



