library(PBSmapping)


### Name: findPolys
### Title: Find Polygons that Contain Events
### Aliases: findPolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create some EventData: a column of points at X = 0.5
  events <- data.frame(EID=1:10, X=.5, Y=seq(0, 2, length=10))
  events <- as.EventData(events, projection=1)
  #--- create a PolySet: two squares with the second above the first
  polys <- data.frame(PID=c(rep(1, 4), rep(2, 4)), POS=c(1:4, 1:4),
    X=c(0, 1, 1, 0, 0, 1, 1, 0),
    Y=c(0, 0, 1, 1, 1, 1, 2, 2))
  polys <- as.PolySet(polys, projection=1)
  #--- show a picture
  plotPolys(polys, xlim=range(polys$X)+c(-0.1, 0.1),
    ylim=range(polys$Y)+c(-0.1, 0.1), projection=1);
  addPoints(events, col=2);
  #--- run findPolys and print the results
  print(findPolys(events, polys))
  par(oldpar)
})



