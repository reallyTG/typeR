library(rgeos)


### Name: gEnvelope
### Title: Envelope of Geometry
### Aliases: gEnvelope RGEOSEnvelope
### Keywords: spatial

### ** Examples

x = readWKT(paste("POLYGON((0 40,10 50,0 60,40 60,40 100,50 90,60 100,60",
 "60,100 60,90 50,100 40,60 40,60 0,50 10,40 0,40 40,0 40))"))
env = gEnvelope(x)

plot(x,col='blue',border='blue')
plot(env,add=TRUE)

#Degenerate Cases
gEnvelope(readWKT("POINT(1 1)")) #returns SpatialPoints
gEnvelope(readWKT("LINESTRING(1 1,1 2)")) #invalid polygon
gEnvelope(readWKT("LINESTRING(1 1,2 1)")) #invalid polygon




