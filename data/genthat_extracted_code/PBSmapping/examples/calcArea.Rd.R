library(PBSmapping)


### Name: calcArea
### Title: Calculate the Areas of Polygons
### Aliases: calcArea
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language == "R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- convert LL to UTM so calculation makes sense
  attr(nepacLL, "zone") <- 9
  nepacUTM <- convUL(nepacLL)
  #--- calculate and print the areas
  print(calcArea(nepacUTM))
})



