library(PBSmapping)


### Name: joinPolys
### Title: Join One or Two PolySets using a Logic Operation
### Aliases: joinPolys
### Keywords: manip logic

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)

  ### Example 1. Cut a triangle out of Vancouver Island
  par(mfrow=c(1,1))
  #--- create a triangle to use in clipping
  polysB <- data.frame(PID=rep(1, 3), POS=1:3,
    X=c(-127.5, -124.5, -125.6), Y = c(49.2, 50.3, 48.6))
  #--- intersect nepacLL with the single polygon, and plot the result
  plotMap(joinPolys(nepacLL, polysB), col="cyan")
  #--- add nepacLL in a different line type to emphasize the intersection
  addPolys(nepacLL, border="purple", lty=3, density=0)
  box()

  ### Example 2. Cut Texada and Lasqueti Islands out of Boxes
  xlim = list(box1=c(-124.8,-124),box2=c(-124,-123.9))
  ylim = list(box1=c(49.4,49.85), box2=c(49.85,49.9))
  Xlim = extendrange(xlim); Ylim=extendrange(ylim)
  polyA = as.PolySet(data.frame(
    PID = rep(1:2,each=4), POS = rep(1:4,2),
    X = as.vector(sapply(xlim,function(x){x[c(1,1,2,2)]})),
    Y = as.vector(sapply(ylim,function(x){x[c(1,2,2,1)]}))
    ), projection="LL")
  data(nepacLLhigh,envir=.PBSmapEnv)
  polyB = nepacLLhigh[is.element(nepacLLhigh$PID,c(736,1912)),]
  polyC = joinPolys(polyA, polyB, "DIFF")
  par(mfrow=c(2,2),cex=1,mgp=c(2,0.5,0))
  plotMap(polyA,col="lightblue",xlim=Xlim,ylim=Ylim)
  addPolys(polyB,col="gold");
  text(mean(Xlim)-0.05,Ylim-0.04,"Boxes (A,B)  and  Isles (C,D)")
  labs = calcCentroid(polyA)
  labs[1,c("X","Y")] = labs[2,c("X","Y")]+c(-0.1,-0.05)
  text(labs[,"X"],labs[,"Y"],c("A","B"),font=2)
  plotMap(polyC[is.element(polyC$PID,1),],col="pink",xlim=Xlim,ylim=Ylim)
  text(mean(Xlim)-0.05,Ylim-0.04,"Box A  \"DIFF\"  Isle C")
  plotMap(polyC[is.element(polyC$PID,3),],col="green",xlim=Xlim,ylim=Ylim)
  text(mean(Xlim)-0.05,Ylim-0.04,"Box A  \"DIFF\"  Isle D")
  plotMap(polyC[is.element(polyC$PID,c(1,3)),],col="cyan",xlim=Xlim,ylim=Ylim)
  text(mean(Xlim)-0.05,Ylim-0.04,"Box A  \"DIFF\"  Isles (C,D)")
  par(oldpar)
})



