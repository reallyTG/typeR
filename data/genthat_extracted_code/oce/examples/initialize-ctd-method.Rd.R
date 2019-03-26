library(oce)


### Name: initialize,ctd-method
### Title: Initialize storage for a ctd object
### Aliases: initialize,ctd-method

### ** Examples


## 1. empty
new("ctd")

## 2. fake data with no location information, so can only
##    plot with the UNESCO equation of state.
##    NOTE: always name arguments, in case the default order gets changed
ctd <- new("ctd", salinity=35+1:3/10, temperature=10-1:3/10, pressure=1:3)
summary(ctd)
plot(ctd, eos="unesco")

## 3. as 2, but insert location and plot with GSW equation of state.
ctd <- oceSetMetadata(ctd, "latitude", 44)
ctd <- oceSetMetadata(ctd, "longitude", -63)
plot(ctd, eos="gsw")




