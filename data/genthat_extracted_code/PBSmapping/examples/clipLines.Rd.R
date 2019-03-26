library(PBSmapping)


### Name: clipLines
### Title: Clip a PolySet as Polylines
### Aliases: clipLines
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create a triangle to clip
  polys <- data.frame(PID=rep(1, 3), POS=1:3, X=c(0,1,0), Y=c(0,0.5,1))
  #--- clip the triangle in the X direction, and plot the results
  plotLines(clipLines(polys, xlim=c(0,.75), ylim=range(polys[, "Y"])))
  par(oldpar)
})



