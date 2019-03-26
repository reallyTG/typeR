library(RcppCCTZ)


### Name: parseDatetime
### Title: Parse a Datetime vector from a string vector
### Aliases: parseDatetime parseDouble

### ** Examples

ds <- getOption("digits.secs")
options(digits.secs=6) # max value
parseDatetime("2016-12-07 10:11:12",        "%Y-%m-%d %H:%M:%S")   # full seconds
parseDatetime("2016-12-07 10:11:12.123456", "%Y-%m-%d %H:%M:%E*S") # fractional seconds
parseDatetime("2016-12-07T10:11:12.123456-00:00")  ## default RFC3339 format
now <- trunc(Sys.time())
parseDatetime(formatDatetime(now + 0:4))	   			# vectorised
options(digits.secs=ds)



