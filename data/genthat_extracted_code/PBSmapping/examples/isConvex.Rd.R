library(PBSmapping)


### Name: isConvex
### Title: Determine Whether Polygons are Convex
### Aliases: isConvex
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- calculate then print the polygons that are convex
  p <- isConvex(nepacLL);
  #--- nepacLL actually contains no convex polygons
  print(p[p$convex,])
})



