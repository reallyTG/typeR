library(rworldmap)


### Name: joinCountryData2Map
### Title: Joins user country referenced data to a map
### Aliases: joinCountryData2Map
### Keywords: dplot

### ** Examples


data("countryExData",envir=environment(),package="rworldmap")

sPDF <- joinCountryData2Map(countryExData
              , joinCode = "ISO3"
              , nameJoinColumn = "ISO3V10"
              )
mapCountryData( sPDF
              , nameColumnToPlot="BIODIVERSITY" 
              )





