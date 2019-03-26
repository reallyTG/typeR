library(rworldmap)


### Name: mapBubbles
### Title: function to produce bubble plots on a map, size and colour
###   determined by attribute data
### Aliases: mapBubbles
### Keywords: aplot

### ** Examples


mapBubbles()
#square symbols
mapBubbles(pch=22)

mapBubbles(dF=getMap(), nameZSize="POP_EST", nameZColour="GEO3")

#change colour
mapBubbles(dF=getMap(), nameZSize="POP_EST", nameZColour="GEO3"
          ,colourPalette='rainbow', oceanCol='lightblue', landCol='wheat') 


data("countryExData",envir=environment(),package="rworldmap")
sPDF <- joinCountryData2Map(countryExData,joinCode = "ISO3"
                           ,nameJoinColumn = "ISO3V10")
                           
mapBubbles(sPDF, nameZSize="POP_EST",nameZColour="BIODIVERSITY"
          ,colourPalette='topo',numCats=5,catMethod="quantiles")

#filled bubbles with set transparency
mapBubbles(fill=TRUE,colourPalette=adjustcolor(palette(), alpha.f = 0.5))
#add bubble edge of a single colour (also with option to set transparency
mapBubbles(nameZColour = adjustcolor('black', alpha.f = 0.7), fill=FALSE, add=TRUE)




