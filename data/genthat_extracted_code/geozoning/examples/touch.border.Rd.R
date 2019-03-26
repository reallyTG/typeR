library(geozoning)


### Name: touch.border
### Title: touch.border
### Aliases: touch.border

### ** Examples

map = geozoning::mapTest
criti = correctionTree(qProb = c(0.5), map = map)
Z = criti$zk[[1]][[1]]$zonePolygone
lab = criti$zk[[1]][[1]]$lab
# zone correction
res = correctBoundaryMap(Zi = Z, map = map)
Z = res$Z
# map boundary after correction
boundary = Z[[1]]
for(i in 2:length(Z)){
  boundary = rgeos::gUnion(boundary, Z[[i]])
}
# plot map
plotM(map = map, Z = Z, lab = lab, byLab = FALSE)
# verification
for(i in 1:length(Z)){
  print(touch.border(z = Z[[i]], boundary = boundary))
}



