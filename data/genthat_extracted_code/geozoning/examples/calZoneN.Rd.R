library(geozoning)


### Name: calZoneN
### Title: calZoneN
### Aliases: calZoneN

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
ptN=mapTest$krigN
nZ=length(K$zonePolygone)
zoneN=matrix(logical(nZ*nZ),nZ,nZ)
listZonePoint=K$listZonePoint
calZoneN(ptN,zoneN,listZonePoint)



