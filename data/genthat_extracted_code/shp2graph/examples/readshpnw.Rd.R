library(shp2graph)


### Name: readshpnw
### Title: Read a network from a "SpatialLines" or "SpatialLinesDataFrame"
###   object
### Aliases: readshpnw
### Keywords: spatial, graph

### ** Examples

data(ORN)
rtNEL<-readshpnw(ORN.nt)
nl<-rtNEL[[2]]
el<-rtNEL[[3]]
#Compute edge length
rtNEL<-readshpnw(ORN.nt, ELComputed=TRUE)
edgelength<-rtNEL[[4]]
eadf<-rtNEL[[5]]



