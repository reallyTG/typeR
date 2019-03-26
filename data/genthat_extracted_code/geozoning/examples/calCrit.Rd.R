library(geozoning)


### Name: calCrit
### Title: calCrit
### Aliases: calCrit

### ** Examples

# compute criterion on test zoning included in package
# load test map with simulated data
data(mapTest)
# load zoning results from test file
data(resZTest)
K=resZTest
resD = calDistance(typedist=1,mapTest$krigData,K$listZonePoint,
       K$zoneN,mapTest$krigSurfVoronoi,K$meanZone,pErr=0.9)
crit = calCrit(resD$matDistanceCorr,K$zoneNModif,2)
print(crit)



