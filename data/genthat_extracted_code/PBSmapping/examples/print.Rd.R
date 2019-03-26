library(PBSmapping)


### Name: print
### Title: Print PBS Mapping Objects
### Aliases: print.EventData print.LocationSet print.PolyData print.PolySet
###   print.summary.PBS
### Keywords: IO

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- change to summary printing style
  PBSprint <- TRUE
  #--- print the PolySet
  print(nepacLL)
})



