library(lubridate)


### Name: parse_date_time
### Title: User friendly date-time parsing functions
### Aliases: parse_date_time parse_date_time2 fast_strptime
### Keywords: chron

### ** Examples


## ** orders are much easier to write **
x <- c("09-01-01", "09-01-02", "09-01-03")
parse_date_time(x, "ymd")
parse_date_time(x, "y m d")
parse_date_time(x, "%y%m%d")
#  "2009-01-01 UTC" "2009-01-02 UTC" "2009-01-03 UTC"

## ** heterogenuous date-times **
x <- c("09-01-01", "090102", "09-01 03", "09-01-03 12:02")
parse_date_time(x, c("ymd", "ymd HM"))

## ** different ymd orders **
x <- c("2009-01-01", "02022010", "02-02-2010")
parse_date_time(x, c("dmY", "ymd"))
##  "2009-01-01 UTC" "2010-02-02 UTC" "2010-02-02 UTC"

## ** truncated time-dates **
x <- c("2011-12-31 12:59:59", "2010-01-01 12:11", "2010-01-01 12", "2010-01-01")
parse_date_time(x, "Ymd HMS", truncated = 3)

## ** specifying exact formats and avoiding training and guessing **
parse_date_time(x, c("%m-%d-%y", "%m%d%y", "%m-%d-%y %H:%M"), exact = TRUE)
parse_date_time(c('12/17/1996 04:00:00','4/18/1950 0130'),
                c('%m/%d/%Y %I:%M:%S','%m/%d/%Y %H%M'), exact = TRUE)

## ** quarters and partial dates **
parse_date_time(c("2016.2", "2016-04"), orders = "Yq")
parse_date_time(c("2016", "2016-04"), orders = c("Y", "Ym"))

## ** fast parsing **
## Not run: 
##D   options(digits.secs = 3)
##D   ## random times between 1400 and 3000
##D   tt <- as.character(.POSIXct(runif(1000, -17987443200, 32503680000)))
##D   tt <- rep.int(tt, 1000)
##D 
##D   system.time(out <- as.POSIXct(tt, tz = "UTC"))
##D   system.time(out1 <- ymd_hms(tt)) # constant overhead on long vectors
##D   system.time(out2 <- parse_date_time2(tt, "YmdHMOS"))
##D   system.time(out3 <- fast_strptime(tt, "%Y-%m-%d %H:%M:%OS"))
##D 
##D   all.equal(out, out1)
##D   all.equal(out, out2)
##D   all.equal(out, out3)
## End(Not run)

## ** how to use `select_formats` argument **
## By default %Y has precedence:
parse_date_time(c("27-09-13", "27-09-2013"), "dmy")

## to give priority to %y format, define your own select_format function:

my_select <-   function(trained, drop=FALSE, ...){
   n_fmts <- nchar(gsub("[^%]", "", names(trained))) + grepl("%y", names(trained))*1.5
   names(trained[ which.max(n_fmts) ])
}

parse_date_time(c("27-09-13", "27-09-2013"), "dmy", select_formats = my_select)

## ** invalid times with "fast" parsing **
parse_date_time("2010-03-14 02:05:06",  "YmdHMS", tz = "America/New_York")
parse_date_time2("2010-03-14 02:05:06",  "YmdHMS", tz = "America/New_York")
parse_date_time2("2010-03-14 02:05:06",  "YmdHMS", tz = "America/New_York", lt = TRUE)



