library(PBSmapping)


### Name: calcLength
### Title: Calculate the Length of Polylines
### Aliases: calcLength
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- calculate the perimeter of Vancouver Island
  print(calcLength(nepacLL[nepacLL$PID==33, ]))
})



