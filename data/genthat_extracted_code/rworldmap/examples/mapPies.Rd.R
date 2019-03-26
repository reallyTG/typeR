library(rworldmap)


### Name: mapPies
### Title: function to produce pie charts on a map
### Aliases: mapPies
### Keywords: aplot

### ** Examples



#getting example data
dF <- getMap()@data  

## these examples repeat the same column in 'nameZs' 
## to show that equal sized pies are created  

#mapPies( dF,nameX="LON", nameY="LAT",nameZs=c('AREA','AREA') )

#mapPies( dF,nameX="LON", nameY="LAT",nameZs=c('AREA','AREA')
#       , mapRegion='africa' )

mapPies( dF,nameX="LON", nameY="LAT"
       , nameZs=c('POP_EST','POP_EST','POP_EST','POP_EST'),mapRegion='africa' )
  





