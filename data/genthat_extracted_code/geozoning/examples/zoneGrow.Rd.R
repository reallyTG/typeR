library(geozoning)


### Name: zoneGrow
### Title: zoneGrow
### Aliases: zoneGrow

### ** Examples

## No test: 
data(mapTest)
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(K$zonePolygone) # plot zoning
kmi=zoneGrow(K,mapTest,6) # grow zone 6 by grouping it with its closest neighbor with same label
linesSp(kmi[[7]])
qProb=c(0.3,0.5)
criti = correctionTree(qProb,mapTest)
best = criti$zk[[2]][[1]]
Z=best$zonePolygone
plotZ(Z)
refPoint = rgeos::gCentroid(Z[[4]])
sp::plot(refPoint,add=TRUE,col="blue",pch=21)
zg=zoneGrow(best,mapTest,4) #grow isolated zone 4 by searching for other quantile
plotZ(zg)
## End(No test)



