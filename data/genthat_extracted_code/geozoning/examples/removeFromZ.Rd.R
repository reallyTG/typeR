library(geozoning)


### Name: removeFromZ
### Title: removeFromZ
### Aliases: removeFromZ

### ** Examples

data(resZTest)
K=resZTest
Z=K$zonePolygone
plotZ(Z)
# remove from Z all zones with less than 10 data points
Z2=removeFromZ(Z,K$zoneN,K$krigN,K$listZonePoint,mapTest$krigData,n=10)
printZid(Z2$Z)



