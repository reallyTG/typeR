library(spatstat)


### Name: persp.im
### Title: Perspective Plot of Pixel Image
### Aliases: persp.im
### Keywords: spatial hplot

### ** Examples

   # an image
   Z <- setcov(owin())
   persp(Z, colmap=terrain.colors(128))
   co <- colourmap(range=c(0,1), col=rainbow(128))
   persp(Z, colmap=co, axes=FALSE, shade=0.3)

   ## Terrain elevation
   persp(bei.extra$elev, colmap=terrain.colors(128),
         apron=TRUE, theta=-30, phi=20,
         zlab="Elevation", main="", ticktype="detailed",
         expand=6)



