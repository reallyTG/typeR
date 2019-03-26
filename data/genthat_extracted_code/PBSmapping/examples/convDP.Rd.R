library(PBSmapping)


### Name: convDP
### Title: Convert EventData/PolyData into a PolySet
### Aliases: convDP
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create sample PolyData
  polyData <- data.frame(PID=c(1, 2, 3),
     x1=c(1, 3, 5), y1=c(1, 3, 2),
     x2=c(1, 4, 5), y2=c(2, 4, 1),
     x3=c(2, 4, 6), y3=c(2, 3, 1))
  #--- print PolyData
  print(polyData)
  #--- make a PolySet from PolyData
  polys <- convDP(polyData,
    xColumns=c("x1", "x2", "x3"),
    yColumns=c("y1", "y2", "y3"))
  #--- print and plot the PolySet
  print(polys)
  plotLines(polys, xlim=c(0,7), ylim=c(0,5), col=2)
  par(oldpar)
})



