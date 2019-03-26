library(rworldmap)


### Name: addMapLegend
### Title: Add a legend to a map
### Aliases: addMapLegend
### Keywords: aplot

### ** Examples


#Set up the plot so the world map uses the full width.
mapDevice() 
#join eaxmple data to a map  
data("countryExData",envir=environment())
sPDF <- joinCountryData2Map(countryExData
              , joinCode = "ISO3"
              , nameJoinColumn = "ISO3V10"
              )
#map the data with no legend              
mapParams <- mapCountryData( sPDF
              , nameColumnToPlot="BIODIVERSITY"
              , addLegend='FALSE' 
              )
              
#add a modified legend using the same initial parameters as mapCountryData               
do.call( addMapLegend, c( mapParams
                        , legendLabels="all"
                        , legendWidth=0.5
                        ))







