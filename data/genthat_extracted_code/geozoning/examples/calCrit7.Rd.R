library(geozoning)


### Name: calCrit7
### Title: calCrit7
### Aliases: calCrit7

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit7(resD$matDistanceCorr,K$zoneNModif)



