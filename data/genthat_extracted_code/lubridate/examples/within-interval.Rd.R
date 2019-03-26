library(lubridate)


### Name: %within%
### Title: Tests whether a date or interval falls within an interval
### Aliases: %within% %within%,Interval,Interval-method
###   %within%,ANY,Interval-method %within%,Date,list-method
###   %within%,POSIXt,list-method

### ** Examples


int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int2 <- interval(ymd("2001-06-01"), ymd("2002-01-01"))

ymd("2001-05-03") %within% int # TRUE
int2 %within% int # TRUE
ymd("1999-01-01") %within% int # FALSE

## recycling
dates <- ymd(c("2014-12-20", "2014-12-30", "2015-01-01", "2015-01-03"))
blackouts<- c(interval(ymd("2014-12-30"), ymd("2014-12-31")),
              interval(ymd("2014-12-30"), ymd("2015-01-03")))
dates %within% blackouts

## within ANY of the intervals of a list
dates <- ymd(c("2014-12-20", "2014-12-30", "2015-01-01", "2015-01-03"))
blackouts<- list(interval(ymd("2014-12-30"), ymd("2014-12-31")),
                 interval(ymd("2014-12-30"), ymd("2015-01-03")))
dates %within% blackouts



