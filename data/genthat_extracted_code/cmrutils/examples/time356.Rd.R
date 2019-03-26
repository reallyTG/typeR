library(cmrutils)


### Name: time365
### Title: Helper Time-Series Routines
### Aliases: time365toDate time365fromDate
### Keywords: utilities ts

### ** Examples

  ## non-leap year
  x <- ts(1:4, start = c(1991, 58), frequency = 365)
  time365toDate(time(x))
  d <- seq.Date(as.Date('1991-02-27'), as.Date('1991-03-02'), 1)
  time365fromDate(d)

  ## leap year
  x <- ts(1:4, start = c(1992, 58), frequency = 365)
  time365toDate(time(x))
  d <- seq.Date(as.Date('1992-02-27'), as.Date('1992-03-02'), 1)
  time365fromDate(d)

  x <- seq(1900, 2100, by = 1/365)
  stopifnot(all(abs(x - time365fromDate(time365toDate(x))) <
                getOption("ts.eps")))



