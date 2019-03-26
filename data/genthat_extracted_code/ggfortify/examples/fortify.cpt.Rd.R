library(ggfortify)


### Name: fortify.cpt
### Title: Convert 'changepoint::cpt' and 'strucchange::breakpoints' to
###   'data.frame'
### Aliases: fortify.cpt fortify.breakpointsfull fortify.breakpoints

### ** Examples

library(changepoint)
fortify(cpt.mean(AirPassengers))
fortify(cpt.var(AirPassengers))
fortify(cpt.meanvar(AirPassengers))

library(strucchange)
bp.nile <- breakpoints(Nile ~ 1)
fortify(bp.nile)
fortify(breakpoints(bp.nile, breaks = 2))
fortify(breakpoints(bp.nile, breaks = 2), data = Nile)



