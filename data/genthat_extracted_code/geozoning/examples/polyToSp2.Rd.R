library(geozoning)


### Name: polyToSp2
### Title: polyToSp2
### Aliases: polyToSp2

### ** Examples

ZK=initialZoning(qProb=c(0.4,0.2,0.7),mapTest)
Z=ZK$resZ$zonePolygone
sp=Z[[5]]
P1=geozoning:::getPolySp(sp,1)
sph=polyToSp2(P1)
plotZ(Z)
sp::plot(sph,col="blue",lwd=2,add=TRUE)



