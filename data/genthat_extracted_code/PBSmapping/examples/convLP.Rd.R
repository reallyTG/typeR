library(PBSmapping)


### Name: convLP
### Title: Convert Polylines into a Polygon
### Aliases: convLP
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create two polylines
  polyline1 <- data.frame(PID=rep(1,2),POS=1:2,X=c(1,4),Y=c(1,4))
  polyline2 <- data.frame(PID=rep(1,2),POS=1:2,X=c(2,5),Y=c(1,4))
  #--- create two plots to demonstrate the effect of `reverse'
  par(mfrow=c(2, 1))
  plotPolys(convLP(polyline1, polyline2, reverse=TRUE), col=2)
  plotPolys(convLP(polyline1, polyline2, reverse=FALSE), col=3)
  par(oldpar)
})



