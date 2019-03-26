library(geozoning)


### Name: orderZ
### Title: orderZ
### Aliases: orderZ

### ** Examples

## No test: 
map=genMap(DataObj=NULL,seed=40,disp=FALSE,krig=1,Vnugget=1.2,typeMod="Gau")
qProb=c(0.275,0.8)
criti=correctionTree(qProb,map,LASTPASS=FALSE)
res=searchNODcrit1(qProb,criti)
b=res$ind[[1]][1]
K=criti$zk[[2]][[b]]
Z=K$zonePolygone
plotZ(Z)
ord=valZ(map,K)$ord
Z=orderZ(Z,ord)
plotZ(Z)
## End(No test)



