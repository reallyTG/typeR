library(PBSmapping)


### Name: addPolys
### Title: Add a PolySet to an Existing Plot as Polygons
### Aliases: addPolys
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create a PolySet to plot
  polys <- data.frame(PID=rep(1,4),POS=1:4,X=c(0,1,1,0),Y=c(0,0,1,1))
  polys <- as.PolySet(polys, projection=1)
  #--- plot the PolySet
  plotPolys(polys,xlim=c(-.5,1.5),ylim=c(-.5,1.5),density=0,projection=1)
  #--- add the PolySet to the plot (in a different style)
  addPolys(polys,col="green",border="blue",lwd=3)
  par(oldpar)
})



