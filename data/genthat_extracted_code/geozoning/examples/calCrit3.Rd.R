library(geozoning)


### Name: calCrit3
### Title: calCrit3
### Aliases: calCrit3

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCrit3(resD$matDistanceCorr,K$zoneNModif)



