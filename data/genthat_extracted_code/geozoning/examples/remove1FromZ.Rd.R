library(geozoning)


### Name: remove1FromZ
### Title: remove1FromZ
### Aliases: remove1FromZ
### Keywords: internal

### ** Examples

data(resZTest)
K=resZTest
Z=K$zonePolygone
plotZ(Z)
plotZ(geozoning:::remove1FromZ(Z,2,K$zoneN))



