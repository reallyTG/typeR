library(geozoning)


### Name: correctBoundaryMap
### Title: correctBoundaryMap
### Aliases: correctBoundaryMap

### ** Examples

map=geozoning::mapTest
criti = correctionTree(qProb = c(0.5), map = map)
Z = criti$zk[[1]][[1]]$zonePolygone
lab = criti$zk[[1]][[1]]$lab
plotM(map = map, Z = Z, lab = lab, byLab = FALSE)
class(rgeos::gIntersection(Z[[1]],Z[[2]])) [1]
class(rgeos::gIntersection(Z[[1]],Z[[5]])) [1]
class(rgeos::gIntersection(Z[[2]],Z[[3]])) [1]
class(rgeos::gIntersection(Z[[2]],Z[[4]])) [1]
res = correctBoundaryMap(Zi = Z, map = map)
Z = res$Z
class(rgeos::gIntersection(Z[[1]],Z[[2]])) [1]
class(rgeos::gIntersection(Z[[1]],Z[[5]])) [1]
class(rgeos::gIntersection(Z[[2]],Z[[3]])) [1]
class(rgeos::gIntersection(Z[[2]],Z[[4]])) [1]
plotM(map = map, Z = Z, lab = lab, byLab = FALSE)



