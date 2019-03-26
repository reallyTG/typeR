library(geozoning)


### Name: getZonePts
### Title: getZonePts
### Aliases: getZonePts

### ** Examples

data(resZTest)
K=resZTest
Z=K$zonePolygone
data(mapTest)
ptsp=mapTest$krigData
res=getZonePts(ptsp,Z[[5]])
plotZ(Z)
points(res$pts,col="blue",pch=20)



