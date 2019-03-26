library(SpatialVx)


### Name: gmm2d
### Title: 2-d Gaussian Mixture Models Verification
### Aliases: gmm2d gmm2d.default gmm2d.SpatialVx plot.gmm2d predict.gmm2d
###   print.gmm2d summary.gmm2d
### Keywords: math models univar

### ** Examples

## Not run: 
##D data( "ExampleSpatialVxSet" )
##D 
##D x <- ExampleSpatialVxSet$vx
##D xhat <- ExampleSpatialVxSet$fcst
##D 
##D u <- min(quantile(c(x[x > 0]), probs = 0.75),
##D     quantile(c(xhat[xhat > 0]), probs = 0.75))
##D 
##D look <- gmm2d(x, xhat=xhat, threshold=u, verbose=TRUE)
##D summary(look)
##D plot(look)
## End(Not run)
## Not run: 
##D # Alternative method to skin the cat.
##D hold <- make.SpatialVx( x, xhat, field.type = "MV Gaussian w/ Exp. Cov.",
##D     units = "units", data.name = "Example", obs.name = "x",
##D     model.name = "xhat" )
##D 
##D look2 <- gmm2d( hold, threshold = u, verbose = TRUE)
##D summary(look2)
##D plot(look2)
##D 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, loc = ICPg240Locs,
##D     map = TRUE, projection = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D look <- gmm2d(hold, threshold=10, verbose=TRUE)
##D plot(look) # This will take a long time!
##D summary(look)
## End(Not run)



