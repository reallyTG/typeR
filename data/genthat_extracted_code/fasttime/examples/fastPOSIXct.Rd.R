library(fasttime)


### Name: fastPOSIXct
### Title: Fast version of 'as.POSIXct.character' for GMT fixed format.
### Aliases: fastPOSIXct
### Keywords: chron

### ** Examples

  ## let us generate a bunch of random timestamps until today
  ts <- as.character(.POSIXct(runif(1e4) * unclass(Sys.time()), "GMT"))

  ## convert them using as.POSIXct
  system.time(a <- as.POSIXct(ts, "GMT"))

  ## same using the fast method
  system.time(b <- fastPOSIXct(ts, "GMT"))

  identical(a, b)



