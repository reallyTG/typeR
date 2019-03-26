library(PBSmapping)


### Name: calcCentroid
### Title: Calculate the Centroids of Polygons
### Aliases: calcCentroid
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- calculate and print the centroids for several polygons
  print(calcCentroid(nepacLL[is.element(nepacLL$PID,c(33,39,47)),]))
})



