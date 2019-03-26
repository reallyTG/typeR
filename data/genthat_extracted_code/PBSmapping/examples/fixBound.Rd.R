library(PBSmapping)


### Name: fixBound
### Title: Fix the Boundary Points of a PolySet
### Aliases: fixBound
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- set up a long horizontal and long vertical line to extend the plot's
  #--- limits, and then try fixing the bounds of a line in the top-left
  #--- corner and a line in the bottom-right corner
  polys <- data.frame(PID=c(1, 1, 2, 2,  3, 3, 4, 4),
    POS=c(1, 2, 1, 2,  1, 2, 1, 2),
    X = c(0, 10, 5, 5, 0.1, 4.9, 5.1, 9.9),
    Y = c(5, 5, 0, 10, 5.1, 9.9, 0.1, 4.9))
  polys <- fixBound(polys, tol=0.0100001)
  plotLines(polys)
  par(oldpar)
})



