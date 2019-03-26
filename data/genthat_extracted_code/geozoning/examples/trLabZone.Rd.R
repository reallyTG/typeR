library(geozoning)


### Name: trLabZone
### Title: trLabZone
### Aliases: trLabZone
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
data(resZTest)
K=resZTest
Ns=geozoning:::getNs(K$zoneNModif,5) # find neighbors of zone 5
zf=zoneFusion3(K,5,Ns,mapTest,disp=0) # merge zone 5 with englobing one
K2=calNei(zf,mapTest$krigData,mapTest$krigSurfVoronoi,mapTest$krigN)
K2=geozoning:::trLabZone(K,K2,mapTest,K$qProb)
## End(No test)



