library(geozoning)


### Name: plotM
### Title: plotM
### Aliases: plotM

### ** Examples

map=geozoning::mapTest
ZK=initialZoning(qProb=c(0.55,0.85),map)
Z=ZK$resZ$zonePolygone # list of zones
lab = ZK$resZ$lab # label of zones
plotM(map = map,Z = Z,lab = lab, byLab = FALSE)




