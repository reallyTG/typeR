library(Hmisc)


### Name: trunc.POSIXt
### Title: Return the floor, ceiling, or rounded value of date or time to
###   specified unit.
### Aliases: truncPOSIXt ceil.POSIXt ceil ceil.default roundPOSIXt
### Keywords: manip utilities chron

### ** Examples

date <- ISOdate(1832, 7, 12)
ceil(date, units='months')  # '1832-8-1'
truncPOSIXt(date, units='years')     # '1832-1-1'
roundPOSIXt(date, digits='months')    # '1832-7-1'



