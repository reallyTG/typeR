library(datetimeutils)


### Name: nth_day
### Title: Compute Reference Dates
### Aliases: nth_day
### Keywords: chron

### ** Examples

timestamps <- seq(from = as.Date("2001-01-01"),
                  to   = as.Date("2001-04-15"),
                  by   = "1 day")

nth_day(timestamps, period = "quarter", n = "last")
## [1] "2001-03-31" "2001-04-15"

nth_day(timestamps, period = "quarter", n = 10)
## [1] "2001-01-10" "2001-04-10"

nth_day(timestamps, period = "quarter", n = 1:2)
## [1] "2001-01-01" "2001-01-02" "2001-04-01" "2001-04-02"

nth_day(timestamps, period = "month", n = "last")
## [1] "2001-01-31" "2001-02-28" "2001-03-31" "2001-04-15"


nth_day(start = as.Date("2016-06-03"),
        end   = as.Date("2017-08-01"),
        period = c(6, 12), n = 3)
## [1] "2016-06-05" "2016-12-03" "2017-06-03"




