library(geozoning)


### Name: getClosePt
### Title: getClosePt
### Aliases: getClosePt
### Keywords: internal

### ** Examples

## No test: 
data(resZTest)
K=resZTest
Z=K$zonePolygone
geozoning:::getClosePt(Z,1,3)
plotZ(Z)
points( geozoning:::getClosePt(Z,1,3),col="blue",pch=20)
## End(No test)



