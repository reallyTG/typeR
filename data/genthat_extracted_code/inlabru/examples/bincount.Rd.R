library(inlabru)


### Name: bincount
### Title: 1D LGCP bin count simulation and comparison with data
### Aliases: bincount

### ** Examples


## Not run: 
##D 
##D # Load a point pattern
##D data(Poisson2_1D)
##D 
##D # Take a look at the point (and frequency) data
##D 
##D ggplot(pts2) + 
##D   geom_histogram(aes(x = x), binwidth = 55/20, boundary = 0, fill = NA, color = "black") +
##D   geom_point(aes(x), y = 0, pch = "|", cex = 4) + 
##D   coord_fixed(ratio = 1)
##D 
##D #' Fit an LGCP model 
##D x <- seq(0, 55, length = 50)
##D mesh1D <- inla.mesh.1d(x, boundary = "free")
##D mdl <- x ~ spde1D(map = x, model = inla.spde2.matern(mesh1D)) + Intercept # SOLUTION
##D fit.spde <- lgcp(mdl, pts2, domain = list(x = c(0,55)))
##D 
##D # Calculate bin statistics
##D bc <- bincount(result = fit.spde, 
##D                observations = pts2, 
##D                breaks = seq(0,max(pts2),length = 12), 
##D                predictor = x ~ exp(spde1D + Intercept))
##D 
##D 
##D # Plot them!
##D attributes(bc)$ggp
##D 
## End(Not run)



