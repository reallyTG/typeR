library(SpatialExtremes)


### Name: profile2d
### Title: Method for profiling (in 2d) fitted max-stable objects
### Aliases: profile2d profile2d.maxstab
### Keywords: models

### ** Examples

## Not run: 
##D ##Define the coordinates of each location
##D n.site <- 30
##D locations <- matrix(rnorm(2*n.site, sd = sqrt(.2)), ncol = 2)
##D colnames(locations) <- c("lon", "lat")
##D 
##D ##Simulate a max-stable process - with unit Frechet margins
##D data <- rmaxstab(30, locations, cov.mod = "whitmat", nugget = 0, range = 30,
##D smooth = 0.5)
##D 
##D ##Now define the spatial model for the GEV parameters
##D param.loc <- -10 + 2 * locations[,2]
##D param.scale <- 5 + 2 * locations[,1] + locations[,2]^2
##D param.shape <- rep(0.2, n.site)
##D 
##D ##Transform the unit Frechet margins to GEV
##D for (i in 1:n.site)
##D   data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
##D param.shape[i]) 
##D 
##D ##Define a model for the GEV margins to be fitted
##D ##shape ~ 1 stands for the GEV shape parameter is constant
##D ##over the region
##D loc.form <- loc ~ lat
##D scale.form <- scale ~ lon + (lat^2)
##D shape.form <- shape ~ 1
##D 
##D ##Fit a max-stable process
##D ##  1- using the Schlather representation
##D fitted <- fitmaxstab(data, locations, "whitmat", loc.form, scale.form,
##D                      shape.form)
##D 
##D ##Plot the profile pairwise log-likelihood for the smooth parameter
##D ranges <- rbind(c(9,11), c(.3, .8))
##D profile2d(fitted, c("range", "smooth"), ranges = ranges)
## End(Not run)



