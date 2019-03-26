library(rtweet)


### Name: round_time
### Title: A generic function for rounding date and time values
### Aliases: round_time

### ** Examples


## class posixct
round_time(Sys.time(), "12 hours")

## class date
unique(round_time(seq(Sys.Date(), Sys.Date() + 100, "1 day"), "weeks"))



