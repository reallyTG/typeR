library(geozoning)


### Name: modlm
### Title: modlm
### Aliases: modlm
### Keywords: internal

### ** Examples

## No test: 
data(resZTest)
K=resZTest
Z=K$zonePolygone
data(mapTest)
ptsp=mapTest$krigData
geozoning:::modlm(ptsp,Z)
## End(No test)



