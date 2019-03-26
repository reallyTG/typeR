library(RApiDatetime)


### Name: rapistrptime
### Title: R Wrappers for 'strptime', 'asPOSIXlt' etc
### Aliases: rapistrptime rapiAsPOSIXlt rapiAsPOSIXct rapiFormatPOSIXlt
###   rapiPOSIXlt2D rapiD2POSIXlt

### ** Examples

op <- options(digits.secs=6)
x <- rapistrptime("2017-01-02 03:04:05.678", "%Y-%m-%d %H:%M:%OS")
format(x)
rapiAsPOSIXlt(as.POSIXct(x))
rapiAsPOSIXct(x)
rapiFormatPOSIXlt(x, "%Y-%b-%d %H:%M:%OS")
options(op)
rapiPOSIXlt2D(x)
rapiD2POSIXlt(as.Date("2017-01-02"))



