library(PBSmapping)


### Name: plotPolys
### Title: Plot a PolySet as Polygons
### Aliases: plotPolys
### Keywords: hplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create a PolySet to plot
  polys <- data.frame(PID=rep(1,4),POS=1:4,X=c(0,1,1,0),Y=c(0,0,1,1))
  #--- plot the PolySet
  plotPolys(polys, xlim=c(-.5,1.5), ylim=c(-.5,1.5), density=0)
  par(oldpar)
})



