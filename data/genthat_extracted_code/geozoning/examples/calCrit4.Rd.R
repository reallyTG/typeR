library(geozoning)


### Name: calCrit4
### Title: calCrit4
### Aliases: calCrit4

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit4(resD$matDistanceCorr,K$zoneNModif)



