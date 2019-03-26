library(geozoning)


### Name: updateZK
### Title: updateZK called by lastPass
### Aliases: updateZK
### Keywords: internal

### ** Examples

data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7
criti=correctionTree(c(0.4,0.7),mapTest,LASTPASS=FALSE)
K1=criti$zk[[1]][[1]]#initial zoning
Z1=K1$zonePolygone
printZsurf(Z1) # 8 zones with 2 small zones (7 and 8)
Z2 = geozoning:::remove1FromZ(Z1,7,K1$zoneN)
printZsurf(Z2) #7 zones
newRes=geozoning:::updateZK(mapTest,c(0.4,0.7),1,1,criti$zk[1],criti$criterion[1],
       criti$cost[1],criti$costL[1],criti$nz[1],criti$mdist[1],K1,Z2)
newZ=newRes$listOfZ[[1]][[1]]$zonePolygone
printZsurf(newZ) #7 zones



