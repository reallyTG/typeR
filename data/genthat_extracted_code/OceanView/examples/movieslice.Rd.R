library(OceanView)


### Name: Moving slices in 3D
### Title: Plotting volumetric data as moving slices in 3D using rgl
### Aliases: movieslice3D
### Keywords: hplot

### ** Examples

 x <- y <- z <- seq(-1, 1, by = 0.1)
 grid   <- mesh(x, y, z)
 colvar <- with(grid, x*exp(-x^2 - y^2 - z^2))

 movieslice3D  (x, y, z, colvar = colvar, ticktype = "detailed")




