library(SpatialExtremes)


### Name: map.latent
### Title: Two dimensional map from a Bayesian hierarchical model
### Aliases: map.latent
### Keywords: hplot

### ** Examples

## Not run: 
##D ## Generate realizations from the model
##D n.site <- 30
##D n.obs <- 50
##D coord <- cbind(lon = runif(n.site, -10, 10), lat = runif(n.site, -10 , 10))
##D 
##D gp.loc <- rgp(1, coord, "powexp", sill = 4, range = 20, smooth = 1)
##D gp.scale <- rgp(1, coord, "powexp", sill = 0.4, range = 5, smooth = 1)
##D gp.shape <- rgp(1, coord, "powexp", sill = 0.01, range = 10, smooth = 1)
##D 
##D locs <- 26 + 0.5 * coord[,"lon"] + gp.loc
##D scales <- 10 + 0.2 * coord[,"lat"] + gp.scale
##D shapes <- 0.15 + gp.shape
##D 
##D data <- matrix(NA, n.obs, n.site)
##D for (i in 1:n.site)
##D   data[,i] <- rgev(n.obs, locs[i], scales[i], shapes[i])
##D 
##D loc.form <- y ~ lon
##D scale.form <- y ~ lat
##D shape.form <- y ~ 1
##D 
##D hyper <- list()
##D hyper$sills <- list(loc = c(1,8), scale = c(1,1), shape = c(1,0.02))
##D hyper$ranges <- list(loc = c(2,20), scale = c(1,5), shape = c(1, 10))
##D hyper$smooths <- list(loc = c(1,1/3), scale = c(1,1/3), shape = c(1, 1/3))
##D hyper$betaMeans <- list(loc = rep(0, 2), scale = c(9, 0), shape = 0)
##D hyper$betaIcov <- list(loc = solve(diag(c(400, 100))),
##D                        scale = solve(diag(c(400, 100))),
##D                        shape = solve(diag(c(10), 1, 1)))
##D 
##D ## We will use an exponential covariance function so the jump sizes for
##D ## the shape parameter of the covariance function are null.
##D prop <- list(gev = c(2.5, 1.5, 0.2), ranges = c(0.7, 0.75, 0.9), smooths = c(0,0,0))
##D start <- list(sills = c(4, .36, 0.009), ranges = c(24, 17, 16), smooths
##D               = c(1, 1, 1),  beta = list(loc = c(26, 0.5), scale = c(10, 0.2),
##D                                shape = c(0.15)))
##D 
##D ## Generate a Markov chain
##D mc <- latent(data, coord, loc.form = loc.form, scale.form = scale.form,
##D              shape.form = shape.form, hyper = hyper, prop = prop, start = start,
##D              n = 100)
##D 
##D x.grid <- y.grid <- seq(-10, 10, length = 50)
##D map.latent(mc, x.grid, y.grid, param = "shape")
## End(Not run)



