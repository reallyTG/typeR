library(Rnightlights)


### Name: validNlPeriods
### Title: Check if an nlPeriod is valid for a given nightlight type
### Aliases: validNlPeriods

### ** Examples

validNlPeriods(c("201401", "201402"),"VIIRS.M")
 #returns
 #$VIIRS.M
 #201401 201402 
 #  TRUE   TRUE

validNlPeriods("201203","VIIRS.M")
 #returns FALSE

validNlPeriods("2012","OLS.Y")
 #returns TRUE




