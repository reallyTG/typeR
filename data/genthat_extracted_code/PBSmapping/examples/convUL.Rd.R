library(PBSmapping)


### Name: convUL
### Title: Convert Coordinates between UTM and Lon/Lat
### Aliases: convUL
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data
  data(nepacLL,envir=.PBSmapEnv)
  #--- set the zone attribute
  #--- use a zone that is most central to the mapped region
  attr(nepacLL, "zone") <- 6
  #--- convert and plot the result
  nepacUTM <- convUL(nepacLL)
  plotMap(nepacUTM)
  par(oldpar)
})



