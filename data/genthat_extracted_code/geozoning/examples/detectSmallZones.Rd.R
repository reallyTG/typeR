library(geozoning)


### Name: detectSmallZones
### Title: detectSmallZones
### Aliases: detectSmallZones

### ** Examples

data(mapTest)
ZK=initialZoning(qProb=c(0.4,0.7),mapTest)
Z=ZK$resZ$zonePolygone
minSize=0.012
iSmall=detectSmallZones(Z,minSize) # 2 small zones



