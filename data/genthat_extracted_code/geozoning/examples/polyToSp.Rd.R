library(geozoning)


### Name: polyToSp
### Title: polyToSp
### Aliases: polyToSp
### Keywords: internal

### ** Examples

## No test: 
ZK=initialZoning(qProb=c(0.4,0.2,0.7),mapTest)
Z=ZK$resZ$zonePolygone
sph=geozoning:::polyToSp(Z,5,2)
plotZ(Z)
sp::plot(sph,type="l",col="blue",add=TRUE)
## End(No test)



