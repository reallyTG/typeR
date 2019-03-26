library(geozoning)


### Name: extractionPoly
### Title: extractionPoly
### Aliases: extractionPoly
### Keywords: internal

### ** Examples

data(mapTest)
ZK=initialZoning(qProb=c(0.2,0.4,0.7),mapTest)
Z=ZK$resZ$zonePolygone
geozoning:::extractionPoly(Z[[5]]) # returns 2 SpatialPolygons



