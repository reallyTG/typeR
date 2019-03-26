library(SpatialExtremes)


### Name: profile
### Title: Method for profiling fitted max-stable objects
### Aliases: profile profile.maxstab
### Keywords: models

### ** Examples

## Not run: 
##D ##Define the coordinates of each location
##D n.site <- 30
##D locations <- matrix(rnorm(2*n.site, sd = sqrt(.2)), ncol = 2)
##D colnames(locations) <- c("lon", "lat")
##D 
##D ##Simulate a max-stable process - with unit Frechet margins
##D data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 100, cov12 =
##D 25, cov22 = 220)
##D 
##D ##Fit a max-stable process
##D ##  1- using the Smith's model
##D fitted <- fitmaxstab(data, locations, "gauss", fit.marge = FALSE)
##D 
##D ##Plot the profile pairwise log-likelihood for the ''cov11'' parameter
##D profile(fitted, "cov11", range = c(20, 180))
## End(Not run)



