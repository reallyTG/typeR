## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  library(geozoning)
  library(sp)
  library(fields)
  library(gstat)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  seed=80
  map=genMap(DataObj=NULL,seed=seed,disp=FALSE,Vmean=15,krig=2,typeMod="Gau")

## ----echo=TRUE,eval=FALSE,message=FALSE, warning=FALSE-------------------
#    # or with the randKmap function:
#    map=randKmap(DataObj=NULL,nPointsK=500,Vmean=10,krig=1)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  dispZ(mapTest$step,matVal=mapTest$krigGrid)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  meanvarSimu(map)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  ro=loopQ3(map,step=0.1,disp=0,QUIET=T)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  bqProb=ro[1,5:7]
  criti=correctionTree(bqProb,map,SAVE=TRUE)
  res=searchNODcrit1(bqProb,criti)
  b=res$ind[[1]][1]
  K=criti$zk[[2]][[b]]
  bZ=K$zonePolygone
  dispZ(map$step,map$krigGrid,zonePolygone=bZ)
  # distance matrix has high values, criterion is the smallest one (6.417)
  # distance between zones 5 and 7
  bmd=criti$mdist[[2]][[b]]
  bcrit=criti$criterion[[2]][[b]]
  bcrit
  bmd

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  wqProb=ro[56,5:7]
  criti=correctionTree(wqProb,map,SAVE=TRUE)
  res=searchNODcrit1(wqProb,criti)
  w=res$ind[[1]][1]
  K=criti$zk[[2]][[w]]
  wZ=K$zonePolygone
  dispZ(map$step,map$krigGrid,zonePolygone=wZ)
  # distance matrix has some low values, criterion is the smallest one (3.747)
  # distance between zones 4 and 8
  wmd=criti$mdist[[2]][[w]]
  wcrit=criti$criterion[[2]][[w]]
  wcrit
  wmd

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  data(mapTest)
  ZK=initialZoning(qProb=c(0.4,0.7),mapTest)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  Z=ZK$resZ$zonePolygone
  class(Z)
  plotZ(Z)
  Zf=zoneFusion2(Z[[5]],Z[[6]])
  class(Zf)
  sp::plot(Zf,add=TRUE,col="blue")

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  K=ZK$resZ
  names(K)
  Z=K$zonePolygone
  plotZ(Z)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  p = K$qProb
  K=labZone(K,p,mapTest$krigGrid)
  print(K$lab)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=7,fig.width=5-----
  K=calNei(Z,mapTest$krigData,mapTest$krigSurfVoronoi,mapTest$krigN,nmin=20)
  Z=K$zonePolygone
  plotZ(Z)
  title("Zoning with zones with less than 20 kriged data points removed",cex.main = 0.5)

## ----session,echo=FALSE,message=FALSE, warning=FALSE---------------------
  sessionInfo()

