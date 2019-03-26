library(lakemorpho)


### Name: lakeSurroundTopo
### Title: Calculate surrounding topography for lake
### Aliases: lakeSurroundTopo

### ** Examples

## No test: 
data(lakes)
inputLM<-lakeSurroundTopo(exampleLake,exampleElev)
inputLM
## End(No test)
## Don't show: 
data(lakes)
x<-as(rgeos::gBuffer(rgeos::gCentroid(exampleLake),width = 100), "SpatialPolygonsDataFrame")
y<-raster::crop(exampleElev,x)
lakeSurroundTopo(x,y)
## End(Don't show)



