library(geozoning)


### Name: optiGrow
### Title: optiGrow grow an isolated zone by finding a bigger contour line
### Aliases: optiGrow

### ** Examples

data(mapTest)
qProb=c(0.3,0.5)
criti = correctionTree(qProb,mapTest)
best = criti$zk[[2]][[1]]
Z=best$zonePolygone
plotZ(Z)
refPoint = rgeos::gCentroid(Z[[4]])
sp::plot(refPoint,add=TRUE,col="blue",pch=21)
zg=optiGrow(best,4,qProb,refPoint,mapTest) #grow zone 4
id=as.numeric(getZoneId(Z[[4]]))
linesSp(zg$Zopti[[id]],col="blue") # new zoning with grown zone 4



