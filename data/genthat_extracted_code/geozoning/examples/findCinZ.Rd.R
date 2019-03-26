library(geozoning)


### Name: findCinZ
### Title: find contour for a given quantile value, within an envelope and
###   englobing current zone
### Aliases: findCinZ
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
qProb=c(0.3,0.5)
criti = correctionTree(qProb,mapTest)
best = criti$zk[[2]][[1]]
Z=best$zonePolygone
plotZ(Z)
iC=4
envel=calFrame(iC,Z,best$zoneNModif)
sp::plot(envel,col="blue",add=TRUE)
vRef=quantile(mapTest$krigGrid,0.6)
resp=geozoning:::findCinZ(iC,Z,best,mapTest,vRef,envel)
sp::plot(resp$contourSp,col="red",add=TRUE)
## End(No test)



