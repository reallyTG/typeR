library(geozoning)


### Name: getPoly
### Title: getPoly
### Aliases: getPoly

### ** Examples

ZK=initialZoning(qProb=c(0.4,0.2,0.7),mapTest)
Z=ZK$resZ$zonePolygone
P1=getPoly(Z,5,1)
P2=getPoly(Z,5,2) # second polygon is a hole
plot(P1@coords,type="l")
lines(P2@coords,type="l",col="blue")



