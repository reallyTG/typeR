library(tripack)


### Name: voronoi.mosaic
### Title: Create a Voronoi mosaic
### Aliases: voronoi.mosaic
### Keywords: spatial

### ** Examples

# example from TRIPACK:
data(tritest)
tritest.vm<-voronoi.mosaic(tritest$x,tritest$y)
tritest.vm
# use a part of the quakes data set:
data(quakes)
quakes.part<-quakes[(quakes[,1]<=-17 & quakes[,1]>=-19.0 &
                     quakes[,2]<=182.0 & quakes[,2]>=180.0),]
quakes.vm<-voronoi.mosaic(quakes.part$lon, quakes.part$lat, duplicate="remove")
quakes.vm



