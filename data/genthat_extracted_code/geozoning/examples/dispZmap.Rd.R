library(geozoning)


### Name: dispZmap
### Title: dispZmap
### Aliases: dispZmap

### ** Examples

seed=80
data(mapTest)
ZK=initialZoning(c(0.5,0.7),mapTest)
K=ZK$resZ
Z=K$zonePolygone
#order zone ids by attribute mean value
ord=order(K$meanZone)
  Z=orderZ(Z,ord)
  plotZ(Z,id=TRUE)



