library(geozoning)


### Name: calNei
### Title: calNei calculate zone neighborhood and assign data points to
###   zones
### Aliases: calNei

### ** Examples

data(mapTest)
ptN=mapTest$krigN
spdata=mapTest$krigData
surfVoronoi=mapTest$surfVoronoi
data(resZTest)
Z=resZTest$zonePolygone
K=calNei(Z,spdata,surfVoronoi,ptN)
names(K)
plotZ(K$zonePolygone)
K=calNei(Z,spdata,surfVoronoi,ptN,nmin=20) #keep only zones with a minimum of 20 data points
plotZ(K$zonePolygone)



