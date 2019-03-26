library(geozoning)


### Name: normDistMat
### Title: normDistMat
### Aliases: normDistMat

### ** Examples

# load test map with simulated data
data(mapTest)
# load zoning results from test file
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
        mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
normDistMat(resD$matDistanceCorr,2)



