library(geozoning)


### Name: calDistance
### Title: calDistance
### Aliases: calDistance

### ** Examples

# load test map with simulated data
data(mapTest)
# load zoning results from test file
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)



