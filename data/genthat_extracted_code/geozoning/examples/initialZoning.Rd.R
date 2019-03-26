library(geozoning)


### Name: initialZoning
### Title: initialZoning zoning with no correction
### Aliases: initialZoning

### ** Examples

data(mapTest)
ZK=initialZoning(qProb=c(0.4,0.7),mapTest)
plotZ(ZK$resZ$zonePolygone)



