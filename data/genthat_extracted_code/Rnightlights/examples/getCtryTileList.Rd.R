library(Rnightlights)


### Name: getCtryTileList
### Title: Returns a list of VIIRS nightlight tiles that a country or
###   countries intersects with
### Aliases: getCtryTileList

### ** Examples

Rnightlights:::getCtryTileList(ctryCodes=c("BDI", "KEN", "RWA", "TZA", "UGA"), 
    nlType="VIIRS.M", omitCountries="none")

#only 1 tile for OLS
Rnightlights:::getCtryTileList(ctryCodes=c("BDI", "KEN", "RWA", "TZA", "UGA"), 
    nlType="OLS.Y", omitCountries="none")
    #returns "DUMMY"




