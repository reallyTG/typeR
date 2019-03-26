library(BMAmevt)


### Name: dnestlog.grid
### Title: PB and NL spectral densities on the two-dimensional simplex
### Aliases: dnestlog.grid dpairbeta.grid

### ** Examples

dpairbeta.grid(par=c( 0.8, 8, 5, 2),
npoints=70, eps = 1e-3, equi = TRUE, displ = TRUE, invisible=TRUE)

##  or ...

Dens <- dpairbeta.grid(par=c(0.8, 8, 5, 2),
npoints=70, eps = 1e-3, equi = TRUE, displ = FALSE)
Grid=discretize(npoints=70,eps=1e-3,equi=TRUE)
dev.new()
image(Grid$X, Grid$Y, Dens)
contour(Grid$X, Grid$Y, Dens, add=TRUE)
add.frame(equi=TRUE, npoints=70, axes=FALSE)



