library(misc3d)


### Name: kde3d
### Title: Compute a Three Dimension Kernel Density Estimate
### Aliases: kde3d
### Keywords: dplot

### ** Examples

  with(quakes, {
      d <- kde3d(long, lat, -depth, n = 40)
      contour3d(d$d, exp(-12), d$x/22, d$y/28, d$z/640,
                color = "green", color2 = "gray", scale=FALSE,
                engine = "standard")
  })



