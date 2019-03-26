library(Rnightlights)


### Name: allValidNlPeriods
### Title: Check if all nlPeriods are valid for given nlTypes
### Aliases: allValidNlPeriods

### ** Examples

Rnightlights:::allValidNlPeriods(c("201401", "201402"),"VIIRS.M")
 #returns TRUE

Rnightlights:::allValidNlPeriods("201203","VIIRS.M")
 #returns FALSE

Rnightlights:::allValidNlPeriods("2012","OLS.Y")
 #returns TRUE




