library(ISOweek)


### Name: ISOweek
### Title: Week of the year according to ISO 8601
### Aliases: ISOweek

### ** Examples

x <- paste(1999:2011, "-12-31", sep = "")
y <- as.Date(x)
data.frame(date = format(y), week = ISOweek(y))
data.frame(date = x, week = ISOweek(x))



