library(geozoning)


### Name: ptInZone
### Title: ptInZone
### Aliases: ptInZone

### ** Examples

data(mapTest)
data(resZTest)
Z=resZTest$zonePolygone
ptInZone(Z[[1]],mapTest$krigData,c(5,500))



