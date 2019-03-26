library(GEOmap)


### Name: zebra
### Title: Horizontal Zebra Scale
### Aliases: zebra
### Keywords: aplot

### ** Examples


library(geomapdata)

data(USAmap)
USALL=list()
USALL$lat=c(24.72853,49.62741)
USALL$lon=c(229.29389,296.41803)
## set UTM projection
PROJ = setPROJ(type = 2, LAT0 =mean(USALL$lat), LON0 = mean(USALL$lon) )

####  plot with UTM  projection:
plotGEOmapXY(USAmap, LIM= c(USALL$lon[1], USALL$lat[1],
     USALL$lon[2], USALL$lat[2]    )  , PROJ=PROJ, add=FALSE, shiftlon=0)

zeb=list()
zeb$x=c(197.727896066)
zeb$y=c(-1155.81158234)

zebra(zeb$x[1],zeb$y[1], 1000, 100, 60, lab="Km", cex=.6)







