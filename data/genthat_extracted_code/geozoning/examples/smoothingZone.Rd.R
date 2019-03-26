library(geozoning)


### Name: smoothingZone
### Title: smoothingZone
### Aliases: smoothingZone

### ** Examples

## No test: 
seed=1
map=genMap(DataObj=NULL,seed=seed,disp=FALSE,krig=2,typeMod="Exp",nPointsK=500)
criti = correctionTree(qProb = c(0.5), map = map)
Z = criti$zk[[1]][[1]]$zonePolygone
lab = criti$zk[[1]][[1]]$lab
# zones' correction
res = correctBoundaryMap(Zi = Z, map = map)
Z = res$Z
# map boundary after correction
boundary = Z[[1]]
for(i in 2:length(Z)){
  boundary = rgeos::gUnion(boundary, Z[[i]])
}
# plot map
plotM(map = map, Z = Z, lab = lab, byLab = FALSE)
# smoothing
zone = Z[[2]]
newZone = smoothingZone(z = zone, width = 0.05, boundary = boundary)
sp::plot(zone)
sp::plot(newZone)
## End(No test)



