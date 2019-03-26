library(rworldmap)


### Name: aggregateHalfDegreeGridToCountries
### Title: Aggregates global half degree gridded data to countries
### Aliases: aggregateHalfDegreeGridToCountries
### Keywords: dplot

### ** Examples



data(gridExData,envir=environment(),package="rworldmap")
gridExData <- get("gridExData")
#aggregating the gridded data to countries
dF <- aggregateHalfDegreeGridToCountries(gridExData)
#joining the aggregated data to a country map
sPDF <- joinCountryData2Map(dF, nameJoinColumn='UN', joinCode='UN')
#plotting the map
mapCountryData(sPDF,nameColumnToPlot='sum_pa2000.asc')





