library(lubridate)


### Name: day
### Title: Get/set days component of a date-time
### Aliases: day mday wday qday yday day<- mday<- qday<- wday<- yday<-
### Keywords: chron manip methods utilities

### ** Examples

x <- as.Date("2009-09-02")
wday(x) #4

wday(ymd(080101))
wday(ymd(080101), label = TRUE, abbr = FALSE)
wday(ymd(080101), label = TRUE, abbr = TRUE)
wday(ymd(080101) + days(-2:4), label = TRUE, abbr = TRUE)

x <- as.Date("2009-09-02")
yday(x) #245
mday(x) #2
yday(x) <- 1  #"2009-01-01"
yday(x) <- 366 #"2010-01-01"
mday(x) > 3



