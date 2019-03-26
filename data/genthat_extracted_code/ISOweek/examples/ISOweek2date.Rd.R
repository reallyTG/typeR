library(ISOweek)


### Name: ISOweek2date
### Title: Converts date from week notation according to ISO 8601 to
###   standard notation
### Aliases: ISOweek2date

### ** Examples

w <- paste("2009-W53", 1:7, sep = "-")
data.frame(weekdate = w, date = ISOweek2date(w))
# convert from calendar date to week date and back to calendar date
x <- paste(1999:2011, "-12-31", sep = "")
w <- date2ISOweek(x)
d <- ISOweek2date(w)
data.frame(date = x, weekdate = w, date2 = d)



