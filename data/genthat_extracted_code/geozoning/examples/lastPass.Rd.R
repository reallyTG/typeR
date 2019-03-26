library(geozoning)


### Name: lastPass
### Title: lastPass
### Aliases: lastPass

### ** Examples

data(mapTest)
criti=correctionTree(c(0.4,0.7),mapTest,LASTPASS=FALSE)
Z=criti$zk[[1]][[1]]$zonePolygone #initial zoning
printZsurf(Z) # 8 zones with 2 small zones (7 and 8)
newRes=lastPass(mapTest,c(0.4,0.7),criti$zk[1],criti$criterion[1],
criti$cost[1],criti$costL[1],criti$nz[1],criti$mdist[1])
newZ=newRes$listOfZ[[1]][[1]]$zonePolygone
printZsurf(newZ) # 6 zones, 2 small zones were removed



