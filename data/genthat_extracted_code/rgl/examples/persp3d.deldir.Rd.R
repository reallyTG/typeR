library(rgl)


### Name: persp3d.deldir
### Title: Plot a Delaunay triangulation.
### Aliases: persp3d.deldir plot3d.deldir as.mesh3d.deldir
### Keywords: graphics

### ** Examples

x <- rnorm(200, sd = 5)
y <- rnorm(200, sd = 5)
r <- sqrt(x^2 + y^2)
z <- 10 * sin(r)/r
col <- cm.colors(20)[1 + round(19*(z - min(z))/diff(range(z)))]
if (requireNamespace("deldir", quietly = TRUE)) {
  dxyz <- deldir::deldir(x, y, z = z, suppressMsge = TRUE)
  persp3d(dxyz, col = col)
  open3d()
  # Do it without smoothing and with a different orientation.
  persp3d(dxyz, col = col, coords = c("z", "x", "y"), smooth = FALSE)
}



