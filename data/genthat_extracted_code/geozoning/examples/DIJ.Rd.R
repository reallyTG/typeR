library(geozoning)


### Name: DIJ
### Title: DIJ
### Aliases: DIJ

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
nz=length(K$zonePolygone)
si2=rep(NA,nz)
for (kk in 1:nz){
si2[kk]=Sigmai2(kk,K$listZonePoint,mapTest$krigData,
        mapTest$krigSurfVoronoi,K$meanZone)$sigmai2
}
d12=DIJ(1,2,si2,K$meanzone,0.9)



