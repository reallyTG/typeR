library(PBSmapping)


### Name: makeGrid
### Title: Make a Grid of Polygons
### Aliases: makeGrid
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- make a 10 x 10 grid
  polyGrid <- makeGrid(x=0:10, y=0:10)
  #--- plot the grid
  plotPolys(polyGrid, density=0, projection=1)
  par(oldpar)
})



