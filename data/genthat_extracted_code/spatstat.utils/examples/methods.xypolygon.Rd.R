library(spatstat.utils)


### Name: methods.xypolygon
### Title: Calculations for Polygons in the Plane
### Aliases: methods.xypolygon verify.xypolygon is.hole.xypolygon
###   Area.xypolygon bdrylength.xypolygon reverse.xypolygon
###   overlap.xypolygon simplify.xypolygon inside.xypolygon
### Keywords: math

### ** Examples

  p <- list(x=c(0,1,4,2), y=c(0,0,2,3))
  is.hole.xypolygon(p)
  Area.xypolygon(p)
  bdrylength.xypolygon(p)
  overlap.xypolygon(p, list(x=p$x+1, y=p$y+1))
  reverse.xypolygon(p)

  plot(c(0,5),c(0,3),type="n",xlab="x", ylab="y")
  polygon(p)
  polygon(simplify.xypolygon(p, 1.1), lty=3)

  plot(c(0,5),c(0,3),type="n",xlab="x", ylab="y")
  polygon(p)
  xx <- runif(10, max=5)
  yy <- runif(10, max=3)
  points(xx, yy)
  ok <- as.logical(inside.xypolygon(list(x=xx, y=yy), p))
  points(xx[ok], yy[ok], pch=16)



