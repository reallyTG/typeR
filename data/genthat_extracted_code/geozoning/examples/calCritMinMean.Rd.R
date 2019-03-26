library(geozoning)


### Name: calCritMinMean
### Title: calCritMinMean
### Aliases: calCritMinMean

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
calCritMinMean(resD$matDistanceCorr,K$zoneNModif)



