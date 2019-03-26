library(rworldmap)


### Name: mapCountryData
### Title: Map country-level data.
### Aliases: mapCountryData
### Keywords: aplot

### ** Examples


mapCountryData()
data("countryExData",envir=environment(),package="rworldmap")
sPDF <- joinCountryData2Map(countryExData
              , joinCode = "ISO3"
              , nameJoinColumn = "ISO3V10"
              )
mapCountryData( sPDF
              , nameColumnToPlot="BIODIVERSITY" 
              )
              
#user defined map colour scheme for categorical data              
mapParams <- mapCountryData(nameColumnToPlot='GEO3major'
              , catMethod='categorical'
              , addLegend='FALSE'
              , colourPalette=c('white','green','red','yellow','blue','black') 
              )
#changing legendText
mapParams$legendText <- c('antarctic','africa','oceania'
                         ,'americas','s.asia','eurasia')              
do.call( addMapLegendBoxes, c(mapParams,x='bottom',title="Region",horiz=TRUE))

##showing how rworldmap can be used with the classInt and RColorBrewer packages
library(classInt)
library(RColorBrewer)
#getting example data and joining to a map
data("countryExData",envir=environment(),package="rworldmap")
sPDF <- joinCountryData2Map(countryExData,joinCode = "ISO3"
                           ,nameJoinColumn = "ISO3V10")
#getting class intervals using a 'jenks' classification in classInt package
classInt <- classIntervals( sPDF$EPI, n=5, style="jenks")
catMethod = classInt$brks
#getting a colour scheme from the RColorBrewer package
colourPalette <- brewer.pal(5,'RdPu')
#calling mapCountryData with the parameters from classInt and RColorBrewer
mapParams <- mapCountryData( sPDF, nameColumnToPlot="EPI", addLegend=FALSE
                           , catMethod = catMethod, colourPalette=colourPalette )
do.call(addMapLegend, c(mapParams
                       ,legendLabels="all"
                       ,legendWidth=0.5
                       ,legendIntervals="data"))

              





