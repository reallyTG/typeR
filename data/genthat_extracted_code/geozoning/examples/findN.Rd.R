library(geozoning)


### Name: findN
### Title: findN
### Aliases: findN

### ** Examples

data(mapTest)
data(resZTest)
K=resZTest
Ns=geozoning:::getNs(K$zoneNModif,4) # neighbors of zone 4
listN =  grep( TRUE , Ns) # zones 2 and 5
findN(K,listN,4) # zone 4 will be merged into zone 5
# not run



