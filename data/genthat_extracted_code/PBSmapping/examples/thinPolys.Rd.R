library(PBSmapping)


### Name: thinPolys
### Title: Thin a PolySet of Polygons
### Aliases: thinPolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- plot a thinned version of Vancouver Island (3 km tolerance)
  plotMap(thinPolys(nepacLL[nepacLL$PID == 33, ], tol = 3))
  #--- add the original Vancouver Island in a different line type to
  #--- emphasize the difference
  addPolys(nepacLL[nepacLL$PID == 33, ], border=2, lty=8, density=0)
  par(oldpar)
})



