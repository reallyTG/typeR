library(geozoning)


### Name: interZoneC
### Title: interZoneC
### Aliases: interZoneC
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(K$zonePolygone) # zoning
closePt = geozoning:::getClosePt(Z,6,8)
points(closePt,col="red")
res  = geozoning:::interZoneC(Z,6,8,closePt)
points(res$spi,col="red")
## End(No test)



