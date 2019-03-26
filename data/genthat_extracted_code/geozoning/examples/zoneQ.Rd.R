library(geozoning)


### Name: zoneQ
### Title: zoneQ
### Aliases: zoneQ
### Keywords: internal

### ** Examples

data(mapTest)
qProb=c(0.3,0.5)
criti = correctionTree(qProb,mapTest)
K = criti$zk[[2]][[1]]
Z=K$zonePolygone
plotZ(Z)
iC=4
iE=detZoneEng(iC,Z,K$zoneNModif)
envel=calFrame(iC,Z,K$zoneNModif)
sp::plot(envel,add=TRUE,col="blue")
Qseq = genQseq(qProb,K,mapTest,iC,iE)
resi = geozoning:::findCinZ(iC,Z,K,mapTest,Qseq[5],envel)
Zopti=geozoning:::zoneQ(resi$contourSp,iC,iE,Z,K)
plotZ(Zopti)



