library(rworldmap)


### Name: mapBars
### Title: function to produce bar plots on a map
### Aliases: mapBars
### Keywords: aplot

### ** Examples



#getting example data
dF <- getMap()@data 
   
mapBars( dF,nameX="LON", nameY="LAT",nameZs=c('POP_EST','GDP_MD_EST') )
mapBars( dF,nameX="LON", nameY="LAT",nameZs=c('POP_EST','GDP_MD_EST'), mapRegion='africa' )
mapBars( dF,nameX="LON", nameY="LAT",nameZs=c('POP_EST','GDP_MD_EST'), 
 mapRegion='africa', symbolSize=20 )
mapBars( dF,nameX="LON", nameY="LAT",nameZs=c('POP_EST','GDP_MD_EST'), mapRegion='africa', 
 symbolSize=20, barOrient = 'horiz' )


# this does work too
#mapBars( dF,nameX="LON", nameY="LAT" 
#       , nameZs=c('POP_EST','GDP_MD_EST')
#       , mapRegion='africa'
#       , symbolSize=4 )       

  





