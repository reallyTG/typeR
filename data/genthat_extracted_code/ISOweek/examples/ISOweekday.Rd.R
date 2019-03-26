library(ISOweek)


### Name: ISOweekday
### Title: Day of week according to ISO 8601
### Aliases: ISOweekday

### ** Examples

x <- paste(1999:2011, "-12-31", sep = "")
y <- as.Date(x)
data.frame(date = format(y), weekday = ISOweekday(y))
data.frame(date = x, weekday = ISOweekday(x))



