library(spTimer)


### Name: NYdata
### Title: Observations of ozone concentration levels, maximum temperature
###   and wind speed.
### Aliases: NYdata NYgrid
### Keywords: datasets

### ** Examples

##
  library("spTimer")
# NY data
  data(NYdata)
  head(NYdata)
# plots in NY map
  NYsite<-unique(cbind(NYdata[,1:3]))
  head(NYsite)
# map
  #library(maps)
  #map(database="state",regions="new york")
  #points(NYsite[,2:3],pch=19)

  # Grid data
  data(NYgrid)
  head(NYgrid)
  grid.coords<-unique(cbind(NYgrid[,8:9]))
  #library(maps)
  plot(grid.coords,pch=19,col=1)
  #map(database="state",regions="new york",add=TRUE)

##



