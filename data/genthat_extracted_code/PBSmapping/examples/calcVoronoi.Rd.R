library(PBSmapping)


### Name: calcVoronoi
### Title: Calculate the Voronoi (Dirichlet) Tesselation for a Set of
###   Points
### Aliases: calcVoronoi
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create some EventData
  events <- as.EventData(data.frame(
    EID=1:200, X=rnorm(200), Y=rnorm(200)), projection=1)
  #--- calculate the Voronoi tesselation
  polys <- calcVoronoi(events)
  #--- create PolyData to color it based on area
  polyData <- calcArea(polys)
  names(polyData)[is.element(names(polyData), "area")] <- "Z"
  colSeq <- seq(0.4, 0.95, length=4)
  polyData <- makeProps(polyData,
    breaks=quantile(polyData$Z,c(0,.25,.5,.75,1)),
    propName="col", propVals=rgb(colSeq,colSeq,colSeq))
  #--- plot the tesselation
  plotMap(polys, polyProps=polyData)
  #--- plot the points
  addPoints(events, pch=19)
  par(oldpar)
})



