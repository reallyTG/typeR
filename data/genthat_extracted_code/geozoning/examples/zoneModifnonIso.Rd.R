library(geozoning)


### Name: zoneModifnonIso
### Title: zoneModifnonIso
### Aliases: zoneModifnonIso

### ** Examples

data(mapTest)
qProb=c(0.2,0.5)
ZK = initialZoning(qProb, mapTest)
K=ZK$resZ
Z=K$zonePolygone
plotZ(Z)
resP=detZoneClose(6,Z,K$zoneNModif) # zone 6 is close to zone 5 and zone 7
zoneClose = resP$zoneClose
kmi = zoneModifnonIso(K,qProb,mapTest,zoneClose,6,disp=1)
plotZ(kmi$zonePolygone) # zones 6 and 7 are joined into new zone 6
# now it is the turn of zone 5
Z=kmi$zonePolygone
resP=detZoneClose(5,Z,kmi$zoneNModif) # zone 5 is close to zone 7 and zone 6
kmi2 = zoneModifnonIso(kmi,qProb,mapTest,resP$zoneClose,5,disp=1)
plotZ(kmi2$zonePolygone) # zones 5 and 6 are joined into new zone 5



