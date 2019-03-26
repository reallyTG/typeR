library(geozoning)


### Name: distanceNormalisationSqrt
### Title: distanceNormalisationSqrt
### Aliases: distanceNormalisationSqrt
### Keywords: internal

### ** Examples

# load test map with simulated data
data(mapTest)
# load zoning results from test file
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,K$zoneN,
       mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
geozoning:::distanceNormalisationSqrt(resD$matDistanceCorr)



