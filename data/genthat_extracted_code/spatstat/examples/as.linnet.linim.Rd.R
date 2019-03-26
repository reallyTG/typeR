library(spatstat)


### Name: as.linnet.linim
### Title: Extract Linear Network from Data on a Linear Network
### Aliases: as.linnet.lpp as.linnet.linim as.linnet.linfun
###   as.linnet.lintess
### Keywords: spatial manip

### ** Examples

  # make some data
  xcoord <- linfun(function(x,y,seg,tp) { x }, simplenet)
  as.linnet(xcoord)
  X <- as.linim(xcoord)
  as.linnet(X)



