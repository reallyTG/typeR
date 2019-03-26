library(geozoning)


### Name: testInterSpeZ
### Title: testInterSpeZ
### Aliases: testInterSpeZ
### Keywords: internal

### ** Examples

## No test: 
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(Z)
Z58=rgeos::gConvexHull(rgeos::gUnion(Z[[8]],Z[[5]]))
Z[[length(Z)+1]]=Z58 # add new zone to zoning
plotZ(Z)
geozoning:::testInterSpeZ(Z)
## End(No test)



