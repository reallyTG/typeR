library(geozoning)


### Name: saveZK
### Title: saveZK function called by correctionTree
### Aliases: saveZK
### Keywords: internal

### ** Examples

data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7
criti=correctionTree(c(0.4,0.7),mapTest,LASTPASS=FALSE,SAVE=TRUE)
K1=criti$zk[[1]][[1]]#initial zoning
Z1=K1$zonePolygone
printZsurf(Z1) # 8 zones with 2 small zones (7 and 8)
Z2 = geozoning:::remove1FromZ(Z1,7,K1$zoneN)
printZsurf(Z2) #7 zones
indCur=2
newRes=geozoning:::saveZK(mapTest,K1,Z2,c(0.4,0.7),criti$zk,indCur,
        criti$criterion,criti$cost,criti$costL,criti$nz,criti$mdist)
newZ=newRes$listOfZ[[2]][[1]]$zonePolygone
printZsurf(newZ) #6 zones



