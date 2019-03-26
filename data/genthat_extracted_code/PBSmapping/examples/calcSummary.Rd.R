library(PBSmapping)


### Name: calcSummary
### Title: Apply Functions to Polygons in a PolySet
### Aliases: calcSummary
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- calculate and print the centroids for several polygons
  print(calcSummary(nepacLL[is.element(nepacLL$PID,c(33,39,47)),],
    rollup=3, FUN=mean))
})



