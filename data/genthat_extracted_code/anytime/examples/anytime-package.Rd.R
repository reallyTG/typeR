library(anytime)


### Name: anytime-package
### Title: Anything to 'POSIXct' or 'Date' Converter
### Aliases: anytime-package
### Keywords: package

### ** Examples

  library(anytime)
  options(digits.secs=6)                ## for fractional seconds below
  Sys.setenv(TZ=anytime:::getTZ())      ## helper function to try to get TZ

  ## integer
  anydate(20160101L + 0:2)

  ## numeric
  anydate(20160101 + 0:2)

  ## factor
  anydate(as.factor(20160101 + 0:2))

  ## ordered
  anydate(as.ordered(20160101 + 0:2))

  ## Dates: Character
  anydate(as.character(20160101 + 0:2))

  ## Dates: alternate formats
  anydate(c("20160101", "2016/01/02", "2016-01-03"))

  ## Datetime: ISO with/without fractional seconds
  anytime(c("2016-01-01 10:11:12", "2016-01-01 10:11:12.345678"))

  ## Datetime: ISO alternate (?) with 'T' separator
  anytime(c("20160101T101112", "20160101T101112.345678"))

  ## Short month '%b' (and full month is supported too)
  anytime(c("2016-Sep-01 10:11:12", "Sep/01/2016 10:11:12", "Sep-01-2016 10:11:12"))

  ## Datetime: Mixed format (cf http://stackoverflow.com/questions/39259184)
  anytime(c("Thu Sep 01 10:11:12 2016", "Thu Sep 01 10:11:12.345678 2016"))



