library(PBSmapping)


### Name: isIntersecting
### Title: Determine Whether Polygons are Self-Intersecting
### Aliases: isIntersecting
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
  data(nepacLL,envir=.PBSmapEnv)
  #--- calculate then print the polygons that are self-intersecting
  p <- isIntersecting(nepacLL, numericResult = FALSE)
  print(p[p$intersecting,])
})



