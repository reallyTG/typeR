library(spatstat)


### Name: perspPoints
### Title: Draw Points or Lines on a Surface Viewed in Perspective
### Aliases: perspPoints perspSegments perspLines perspContour
### Keywords: spatial hplot

### ** Examples

  M <- persp(bei.extra$elev, colmap=terrain.colors(128),
             apron=TRUE, theta=-30, phi=20,
             zlab="Elevation", main="", 
             expand=6, visible=TRUE, shade=0.3)

  perspContour(bei.extra$elev, M=M, col="pink", nlevels=12)
  perspPoints(bei, Z=bei.extra$elev, M=M, pch=16, cex=0.3, col="chartreuse")



