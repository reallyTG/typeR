library(spatstat)


### Name: coords
### Title: Extract or Change Coordinates of a Spatial or Spatiotemporal
###   Point Pattern
### Aliases: coords coords.ppp coords.ppx coords<- coords<-.ppp
###   coords<-.ppx
### Keywords: spatial manip

### ** Examples

   df <- data.frame(x=runif(4),y=runif(4),t=runif(4))
   X <- ppx(data=df, coord.type=c("s","s","t"))
   coords(X)
   coords(X, temporal=FALSE)
   coords(X) <- matrix(runif(12), ncol=3)



