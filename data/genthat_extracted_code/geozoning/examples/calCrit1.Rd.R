library(geozoning)


### Name: calCrit1
### Title: calCrit1
### Aliases: calCrit1

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit1(resD$matDistanceCorr,K$zoneNModif)



