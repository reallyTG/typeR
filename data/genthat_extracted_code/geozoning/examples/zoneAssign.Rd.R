library(geozoning)


### Name: zoneAssign
### Title: zoneAssign
### Aliases: zoneAssign

### ** Examples

data(mapTest)
ZK=initialZoning(qProb=c(0.4,0.7),mapTest)
Z=ZK$resZ$zonePolygone
listZpts=zoneAssign(mapTest$krigData,Z)
#identical to ZK$resZ$listZonePoint
listZptsRaw=zoneAssign(mapTest$rawData,Z)
plotZ(Z)
points(mapTest$rawData[listZptsRaw[[1]],],col="blue") # add raw data for zone 1



