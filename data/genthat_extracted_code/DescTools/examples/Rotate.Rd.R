library(DescTools)


### Name: Rotate
### Title: Rotate a Geometric Structure
### Aliases: Rotate
### Keywords: aplot

### ** Examples

# let's have a triangle
Canvas(main="Rotation")
x <- DrawRegPolygon(nv=3)[[1]]

# and rotate
sapply( (0:3) * pi/6, function(theta) {
  xy <- Rotate( x=x, theta=theta )
  polygon(xy, col=SetAlpha("blue", 0.2))
} )

abline(v=0, h=0)



