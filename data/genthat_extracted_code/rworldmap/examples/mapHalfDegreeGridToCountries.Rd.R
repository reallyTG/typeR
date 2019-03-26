library(rworldmap)


### Name: mapHalfDegreeGridToCountries
### Title: Maps user half degree gridded data at country level by first
###   aggregating.
### Aliases: mapHalfDegreeGridToCountries
### Keywords: aplot

### ** Examples



data(gridExData,envir=environment(),package="rworldmap")
gridExData <- get("gridExData")
mapHalfDegreeGridToCountries(gridExData)             

#different aggregate option
mapHalfDegreeGridToCountries( gridExData, aggregateOption="mean" )





