library(Watersheds)


### Name: RiverStation
### Title: Intersection of 'SpatialPoints' and 'SpatialLinesDataFrame'
### Aliases: RiverStation
### Keywords: RiverStation

### ** Examples

library(Watersheds)
data(WatershedsData)

station1 = WatershedsData$station
river1 = WatershedsData$river

tributary = RiverStation(station1, river1)
plot(tributary, col="blue")
plot(station1,pch=21,bg="red",cex=.8,add=TRUE)
plot.PolyLineAttribute(x=tributary, y="OBJECTID", dist=100, cex=.8)
title(main="Point station and tributary rivers")


