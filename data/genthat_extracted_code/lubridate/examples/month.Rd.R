library(lubridate)


### Name: month
### Title: Get/set months component of a date-time
### Aliases: month month<-
### Keywords: chron manip methods utilities

### ** Examples

x <- ymd("2012-03-26")
month(x)
month(x) <- 1
month(x) <- 13
month(x) > 3

month(ymd(080101))
month(ymd(080101), label = TRUE)
month(ymd(080101), label = TRUE, abbr = FALSE)
month(ymd(080101) + months(0:11), label = TRUE)



