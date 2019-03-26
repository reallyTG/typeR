## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  library(geozoning)
  library(sp)
  library(fields)

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=10----------------
  seed=80
  map=genMap(DataObj=NULL,seed=seed,disp=FALSE,krig=2,Vmean=15,typeMod="Exp")

## ----echo=TRUE,message=FALSE, warning=FALSE,fig.height=10,fig.width=10----
  plotMap(map)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  # Check the mean and standard deviation of generated data
  meanvarSimu(map)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  qq=quantile(map$krigGrid,na.rm=TRUE,prob=c(0.5,0.7))
  dispZ(map$step,map$krigGrid,valQ=qq)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  # names(ZK):  "resCrit"  "resDist" "resZ" "cL" "qProb"
  ZK=initialZoning(qProb=c(0.5,0.7),map=map) 

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
   K=ZK$resZ
   Z=K$zonePolygone
   plotZ(Z)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
   # Outline boundaries of zone 12 with different colors
   dispZ(map$step,map$krigGrid,zonePolygone=Z,iZ=12)
   # Outline all polygons of zone 13 with a different color
   linesSp(Z[[13]],col="blue") # first one in blue
   linesSp(Z[[2]],k=2,col="green") # second one in red, and so on
   # A zone can have one or several holes
   # and each hole is an independent zone. zone 2 has 3 holes (zones 3,8,4). 
   # Due to its shape and to the common borders with the map boundary, 
   # zone 7 is not a hole in zone 2.
   holeSp(Z[[2]])

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
   kmi=optiRG(K,map,12,13,disp=1)
   plotZ(kmi$zonePolygone)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  dispZ(map$step,map$krigGrid,zonePolygone=Z,K=K,boundary=map$boundary,nbLvl=0,id=FALSE,mu=2,cex=0.7) 
  # add quantile values and criterion value for Z
  title(paste(" q=[",toString(round(qq,2)),"]  crit=",round(ZK$resCrit,2),sep="")) 
  # print zone labels
  printLabZ(list(K))
  # print zone areas
  printZsurf(K$zonePolygone)
  # print zone ids
  printZid(Z)
  # remove zones with less than 10 data points
  K=calNei(Z,map$krigData,map$krigSurfVoronoi,map$krigN,nmin=10)
  plotZ(K$zonePolygone)

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
   val=valZ(map,K)$val
   boxplot(val,col=topo.colors(length(val)))

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
  #save all branches resulting from correction steps
  criti<-correctionTree(c(0.4,0.7),map,SAVE=TRUE,ALL=TRUE,LASTPASS=FALSE,distIsoZ=0.01)
  zk=criti$zk

## ----echo=TRUE,message=FALSE, warning=FALSE------------------------------
   Z21=zk[[2]][[1]]$zonePolygone
   Z22=zk[[2]][[2]]$zonePolygone
   plotZ(Z21,id=TRUE) # result of removal of zone #4
   plotZ(Z22,id=TRUE) # result of growing of zone #4

## ----echo=TRUE,eval=FALSE,message=FALSE, warning=FALSE-------------------
#     # successively:  removal of zone#4  in Z21, growing of zone#4  in Z21
#     # removal of zone#4  in Z22, growing of zone#4  in Z22
#     # other try with LASTPASS=TRUE removes at last step the zones that are still too small
#     # after all successive corrections
#     criti<-correctionTree(c(0.4,0.7),map,SAVE=TRUE,ALL=TRUE,LASTPASS=TRUE,distIsoZ=0.001)
#  
#     # other run with ALL=FALSE saves memory by keeping only the first and the last levels
#     criti<-correctionTree(c(0.4,0.7),map,SAVE=TRUE,ALL=FALSE,LASTPASS=FALSE,distIsoZ=0.001)

## ----session,echo=FALSE,message=FALSE, warning=FALSE---------------------
  sessionInfo()

