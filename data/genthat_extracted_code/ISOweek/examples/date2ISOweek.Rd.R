library(ISOweek)


### Name: date2ISOweek
### Title: Converts date from standard notation to week notation according
###   to ISO 8601
### Aliases: date2ISOweek

### ** Examples

x <- paste(1999:2011, "-12-31", sep = "")
y <- as.Date(x)
data.frame(date = format(y), weekdate = date2ISOweek(y))
data.frame(date = x, weekdate = date2ISOweek(x))



