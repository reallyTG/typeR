library(rworldmap)


### Name: barplotCountryData
### Title: Barplot country-level data.
### Aliases: barplotCountryData
### Keywords: aplot

### ** Examples


#default uses popn data in the default map
barplotCountryData()


data("countryExData",envir=environment(),package="rworldmap")

barplotCountryData( countryExData
              , nameColumnToPlot="BIODIVERSITY" 
              , nameCountryColumn = "Country"
              )
              

              




