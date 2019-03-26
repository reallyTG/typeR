library(misc3d)


### Name: pointsTetrahedra
### Title: Create a Set of Tetrahetra Centered at Data Points
### Aliases: pointsTetrahedra
### Keywords: hplot

### ** Examples

  with(quakes, {
      d <- kde3d(long, lat, -depth, n = 40)
      v <- contour3d(d$d, exp(-12),d$x/22, d$y/28, d$z/640,
                     color="green", color2="gray", draw=FALSE)
      p <- pointsTetrahedra(long/22, lat/28, -depth/640,
                            size = 0.005)
      drawScene(list(v, p))
  })



