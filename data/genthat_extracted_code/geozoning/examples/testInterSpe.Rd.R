library(geozoning)


### Name: testInterSpe
### Title: testInterSpe
### Aliases: testInterSpe
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(Z)
Z58=rgeos::gConvexHull(rgeos::gUnion(Z[[8]],Z[[5]]))
Z[[length(Z)+1]]=Z58 # add new zone to zoning
plotZ(Z)
geozoning:::testInterSpe(Z,6,length(Z))
## End(No test)



