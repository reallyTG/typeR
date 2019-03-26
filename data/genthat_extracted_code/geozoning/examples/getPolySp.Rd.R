library(geozoning)


### Name: getPolySp
### Title: getPolySp
### Aliases: getPolySp
### Keywords: internal

### ** Examples

ZK=initialZoning(qProb=c(0.4,0.2,0.7),mapTest)
Z=ZK$resZ$zonePolygone
sp=Z[[5]]
P1=geozoning:::getPolySp(sp,1)
P2=geozoning:::getPolySp(sp,2) # second polygon is a hole
plot(P1@coords,type="l")
lines(P2@coords,type="l",col="blue")



