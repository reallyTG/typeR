library(PBSmapping)


### Name: clipPolys
### Title: Clip a PolySet as Polygons
### Aliases: clipPolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create a triangle that will be clipped
  polys <- data.frame(PID=rep(1, 3), POS=1:3, X=c(0,1,.5), Y=c(0,0,1))
  #--- clip the triangle in the X direction, and plot the results
  plotPolys(clipPolys(polys,xlim=c(0,.75),ylim=range(polys[,"Y"])),col=2)
  par(oldpar)
})



