library(geozoning)


### Name: optiRG
### Title: optiRG join two zones close to each other
### Aliases: optiRG

### ** Examples

data(mapTest)
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(K$zonePolygone) # zoning
kmi=optiRG(K,mapTest,6,7,disp=1)
#zones 6 and 7 are joined into new zone 6
sp::plot(kmi$zonePolygone[[6]],col="red",add=TRUE)



