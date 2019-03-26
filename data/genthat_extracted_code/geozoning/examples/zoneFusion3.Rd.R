library(geozoning)


### Name: zoneFusion3
### Title: zoneFusion3
### Aliases: zoneFusion3

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
Ns=geozoning:::getNs(K$zoneNModif,5) # find neighbors of zone 5
zoneFusion3(K,5,Ns,mapTest,disp=2) # merge and plot result of merging



