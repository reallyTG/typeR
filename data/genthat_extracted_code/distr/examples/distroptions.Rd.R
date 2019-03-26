library(distr)


### Name: distroptions
### Title: functions to change the global variables of the package 'distr'
### Aliases: distroptions getdistrOption DefaultNrGridPoints
###   DistrResolution DistrCollapse TruncQuantile WarningSim WarningArith
###   DefaultNrFFTGridPointsExponent RtoDPQ.e WarningArith WarningSim
###   withSweave warn.makeDNew withgaps use.generalized.inverse.by.default
###   DistributionAggregate.Unique.Warn
### Keywords: distribution

### ** Examples

distroptions("RtoDPQ.e") # returns the value of RtoDPQ.e, by default = 5
currentDistrOptions <- distroptions()
distroptions(RtoDPQ.e = 6)
distroptions("RtoDPQ.e") 
getdistrOption("RtoDPQ.e") 
distroptions(c("WarningSim","WarningArith"))   
getdistrOption("WarningSim")   
distroptions("WarningSim" = FALSE)   
         # switches off warnings as to (In)accuracy due to simulations
distroptions("WarningArith" = FALSE) 
         # switches off warnings as to arithmetics
distroptions(currentDistrOptions)



