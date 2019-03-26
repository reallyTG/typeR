library(OceanView)


### Name: Moving surfaces in 3D
### Title: Plotting moving surfaces in 3D using rgl
### Aliases: moviepersp3D
### Keywords: hplot

### ** Examples

 x <- y <- t <- seq(-1, 1, by = 0.1)
 grid   <- mesh(x, y, t)
 z <- with(grid, x*exp(-x^2 - y^2 - z^2))

 moviepersp3D  (x, y, z = z, colvar = z, colkey = TRUE,
   ticktype = "detailed", wait = 0.1, main = "t = ")

## Not run: 
##D  moviepersp3D (x, y, z = z, colvar = z, colkey = TRUE,
##D    aspect = TRUE, bty = "n", ask = FALSE, main = "t = ")
## End(Not run)




