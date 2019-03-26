library(geozoning)


### Name: labZone0
### Title: labZone0
### Aliases: labZone0
### Keywords: internal

### ** Examples

data(mapTest)
dataF=mapTest$krigGrid
data(resZTest)
K=resZTest
p = K$qProb
geozoning:::labZone0(K,p,dataF)
# not run



