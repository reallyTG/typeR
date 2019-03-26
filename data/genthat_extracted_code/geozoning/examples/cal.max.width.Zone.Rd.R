library(geozoning)


### Name: cal.max.width.Zone
### Title: cal.max.width.Zone
### Aliases: cal.max.width.Zone

### ** Examples

## No test: 
seed=1
map=genMap(DataObj=NULL,seed=seed,disp=FALSE,krig=2,typeMod="Gau")
criti = correctionTree(qProb = c(0.4,0.6), map = map)
Z = criti$zk[[2]][[1]]$zonePolygone
lab = criti$zk[[2]][[1]]$lab
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
widthMax = cal.max.width.Zone(z = Z[[3]], step = 0.001,
            widthMax = 0.05, boundary = boundary, erosion = TRUE)
zone = zone.extended(z = Z[[3]], boundary = boundary)
erosion1 = rgeos::gBuffer(zone ,width = - (widthMax + 0.002) ,joinStyle="ROUND",capStyle = "ROUND")
erosion2 = rgeos::gBuffer(zone ,width = - (widthMax - 0.002) ,joinStyle="ROUND",capStyle = "ROUND")
rgeos::plot(erosion1)
rgeos::plot(erosion2)
## End(No test)



