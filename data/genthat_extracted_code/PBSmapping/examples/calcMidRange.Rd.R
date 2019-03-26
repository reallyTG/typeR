library(PBSmapping)


### Name: calcMidRange
### Title: Calculate the Midpoint of the X/Y Ranges of Polygons
### Aliases: calcMidRange
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- calculate and print the centroids for several polygons
  print(calcMidRange(nepacLL[is.element(nepacLL$PID,c(33,39,47)),]))
})



