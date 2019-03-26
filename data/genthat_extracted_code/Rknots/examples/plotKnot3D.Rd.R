library(Rknots)


### Name: plotKnot3D
### Title: 3D plot of a polygonal link
### Aliases: plotKnot3D
### Keywords: graphics

### ** Examples

## Not run: 
##D ##3D plot of the Hopf link
##D 
##D hopf <- matrix(c(0.000084, -1.667027, -0.000300,
##D     0.179585, 0.249735, 0.991541,
##D     -0.179478, 0.250355, -0.991211,
##D     0.000084, -1.667027, -0.000300,
##D     -0.991561, -0.250457, 0.179413,
##D     -0.000415, 1.666817, 0.000107,
##D     0.991784, -0.249435, -0.179541,
##D     -0.991561, -0.250457, 0.179413),
##D     ncol = 3, byrow = TRUE)
##D 			
##D plotKnot3D(hopf, ends = 4, text = FALSE, showNC = FALSE, lwd = 5, radius = 0.05)
##D 
##D ##Stevedore knot
##D data(Rolfsen.table, package = "Rknots")
##D stevedore <- Rolfsen.table$"6.1"
##D plotKnot3D(stevedore, ends = c(), text = FALSE, showNC = FALSE, 
##D     radius = 0.05, lwd = 5)
##D 
##D #The same plot, without specifying any parameter for the rgl primitive shapes 
##D # (the default sphere radius is 1).
##D plotKnot3D(stevedore, ends = c(), text = FALSE)
## End(Not run)



