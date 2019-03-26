library(PCICt)


### Name: as.PCICt
### Title: PCICt
### Aliases: as.PCICt as.PCICt.default as.PCICt.POSIXlt as.PCICt.POSIXct
###   as.PCICt.numeric .PCICt as.POSIXct.PCICt as.POSIXlt.PCICt
###   as.character.PCICt
### Keywords: ts

### ** Examples

## Convert these strings to PCICt objects.
x <- as.PCICt(c("1961-09-02", "1963-02-01"), cal="360_day")

## Convert these strings to POSIXlt objects, then coerce them into PCICt objects.
y <- as.POSIXlt(c("1961-09-02", "1963-02-01"))
x <- as.PCICt(y, cal="360_day")

## Convert a string to PCICt using a format string.
q <- as.PCICt("03292001", cal="365_day", format="%m%d%Y")

## This will cause a parsing error.
## Not run: bad.r <- as.PCICt("moo", cal="365_day")

## Convert a POSIXct to PCICt 360-day
foo <- as.POSIXct("2011-04-01")
bar <- as.PCICt(as.character(foo), cal="360_day")

## Test whether the result is the same
baz <- as.PCICt("2011-04-01", cal="360_day")
bar == baz

## Convert a sequence of days plus an origin to PCICt (as seen in NetCDF files)
cal <- "365_day"
origin <- "1968-01-01"
seconds.per.day <- 86400
ts.dat.days <- 0:100
origin.pcict <- as.PCICt(origin, cal)
ts.dat.pcict <- origin.pcict + (ts.dat.days * seconds.per.day)



