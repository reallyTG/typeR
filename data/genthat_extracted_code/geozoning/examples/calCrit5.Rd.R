library(geozoning)


### Name: calCrit5
### Title: calCrit5
### Aliases: calCrit5

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit5(resD$matDistanceCorr,K$zoneNModif)



