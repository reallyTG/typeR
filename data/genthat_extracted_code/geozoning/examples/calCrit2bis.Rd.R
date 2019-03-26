library(geozoning)


### Name: calCrit2bis
### Title: calCrit2bis
### Aliases: calCrit2bis

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit2(resD$matDistanceCorr,K$zoneNModif)



