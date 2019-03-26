library(PBSmapping)


### Name: extractPolyData
### Title: Extract PolyData from a PolySet
### Aliases: extractPolyData
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- create a PolySet with an extra column
  polys <- data.frame(PID = c(rep(1, 10), rep(2, 10)),
    POS = c(1:10, 1:10),
    X = c(rep(1, 10), rep(1, 10)),
    Y = c(rep(1, 10), rep(1, 10)),
    colour = (c(rep("green", 10), rep("red", 10))))
  #--- extract the PolyData
  print(extractPolyData(polys))
})



