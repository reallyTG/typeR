library(mgcViz)


### Name: plotSlice
### Title: Plotting sequence of slices of 2D smooth effect
### Aliases: plotSlice

### ** Examples

## Not run: 
##D ### Example 1: plotting slices of 3D smooth
##D # Simulate data and fit GAM
##D library(mgcViz)
##D n <- 1e3
##D x <- rnorm(n); y <- rnorm(n); z <- rnorm(n)
##D ob <- (x-z)^2 + (y-z)^2 + rnorm(n)
##D b <- gam(ob ~ s(x, y, z))
##D v <- getViz(b)
##D 
##D # Get plot of slices and add layers
##D pl <- plotSlice(x = sm(v, 1), 
##D                 fix = list("z" = seq(-2, 2, length.out = 9)))
##D pl + l_fitRaster() + l_fitContour() + l_points() + l_rug()
##D 
##D # Over-ride default layout
##D pl <- plotSlice(x = sm(v, 1), 
##D                 fix = list("z" = seq(-2, 2, length.out = 9)), 
##D                 a.facet = list(nrow = 2))
##D pl + l_fitRaster() + l_fitContour() + theme(panel.spacing = unit(0.5, "lines"))
##D 
##D ### Example 2: plotting slices of 4D smooth
##D # Simulate data and fit GAM
##D n <- 5e3
##D x <- rnorm(n); y <- rnorm(n); z <- rnorm(n); z2 <- rnorm(n)
##D ob <- (x-z)^2 + (y-z)^2 + z2^3 + rnorm(n)
##D b <- bam(ob ~ s(x, y, z, z2), discrete = TRUE)
##D v <- getViz(b)
##D 
##D # Plot slices across "z" and "x"
##D pl <- plotSlice(x = sm(v, 1), 
##D                 fix = list("z" = seq(-2, 2, length.out = 3), "x" = c(-1, 0, 1)))
##D pl + l_fitRaster() + l_fitContour() + l_points() + l_rug()
##D 
##D # Plot slices across "x", keeping "z" fixed
##D pl <- plotSlice(x = sm(v, 1), 
##D                 fix = list("z" = 0, "x" = seq(-3, 3, length.out = 9)))
##D pl + l_fitRaster() + l_fitContour() + l_points() + l_rug()
## End(Not run)




