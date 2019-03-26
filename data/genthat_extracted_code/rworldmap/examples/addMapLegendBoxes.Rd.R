library(rworldmap)


### Name: addMapLegendBoxes
### Title: Add a legend of coloured boxes to a map
### Aliases: addMapLegendBoxes
### Keywords: aplot

### ** Examples


#Set up the plot so the world map uses the full width.
mapDevice() 
#map example categorical data with no legend              
mapParams <- mapCountryData(nameColumnToPlot='GEO3major'
              , catMethod='categorical'
              , addLegend='FALSE' 
              )
              
#add default legend using the same parameters as mapCountryData               
do.call( addMapLegendBoxes, c( mapParams))

#adding a modified legend by specifying extra parameters               
do.call( addMapLegendBoxes, c(mapParams,x='bottom',horiz=TRUE,title="Region"))

#user defined map colour sceme              
mapParams <- mapCountryData(nameColumnToPlot='GEO3major'
              , catMethod='categorical'
              , addLegend='FALSE'
              , colourPalette=c('white','green','red','yellow','blue','black') 
              )
#changing legendText
mapParams$legendText <- c('antarctic','africa','oceania'
                         ,'americas','s.asia','eurasia')              
do.call( addMapLegendBoxes, c(mapParams,x='bottom',title="Region",horiz=TRUE))

#or this way
#do.call( addMapLegendBoxes
#        , c(mapParams
#           ,list(legendText=c('antarctic','africa','oceania'
#                              ,'americas','s.asia','eurasia')
#                ,x='bottom',title="Region",horiz=TRUE)))






