library(geozoning)


### Name: nPolySp
### Title: nPolySp
### Aliases: nPolySp
### Keywords: internal

### ** Examples

ZK=initialZoning(qProb=c(0.4,0.2,0.7),mapTest)
Z=ZK$resZ$zonePolygone
print(paste(geozoning:::nPolySp(Z[[2]]),"polygons"))



