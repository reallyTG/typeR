library(SpatialVx)


### Name: FeatureFinder
### Title: Threshold-based Feature Finder
### Aliases: FeatureFinder plot.features print.features summary.features
###   plot.summary.features
### Keywords: math manip graphs

### ** Examples


## Not run: 
##D x <- y <- matrix(0, 100, 100)
##D x[2:3,c(3:6, 8:10)] <- 1
##D y[c(4:7, 9:10),c(7:9, 11:12)] <- 1
##D      
##D x[30:50,45:65] <- 1
##D y[c(22:24, 99:100),c(50:52, 99:100)] <- 1
##D      
##D hold <- make.SpatialVx( x, y, field.type = "contrived", units = "none",
##D          data.name = "Example", obs.name = "x", model.name = "y" )
##D      
##D look <- FeatureFinder(hold, smoothpar=0.5) 
##D 
##D par( mfrow=c(1,2))
##D image.plot(look$X.labeled)
##D image.plot(look$Y.labeled)
##D      
##D look2 <- centmatch(look)
##D      
##D FeatureTable(look2)
##D      
##D look3 <- deltamm( look, N = 201, verbose = TRUE ) 
##D FeatureTable( look3 )
##D 
##D 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D      
##D hold <- make.SpatialVx( pert000, pert004,
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D      
##D look <- FeatureFinder(hold, smoothpar=10.5, thresh = 5)
##D plot(look)
##D 
##D look2 <- deltamm( look, N = 701, verbose = TRUE )
##D 
##D look2 <- MergeForce( look2 )
##D 
##D plot(look2)
##D 
##D summary( look2 )
##D 
##D # Now remove smallest features ( those with fewer than 700 grid squares).
##D 
##D look <- FeatureFinder( hold, smoothpar = 10.5, thresh = 5, min.size = 700 )
##D 
##D look # Now only two features.
##D 
##D plot( look )
##D 
##D # Now remove the largest features (those with more than 1000 grid squares). 
##D 
##D look <- FeatureFinder( hold, smoothpar = 10.5, thresh = 5, max.size = 1000 )
##D 
##D look
##D 
##D plot( look )
##D 
##D # Remove any features smaller than 700 and larger than 2000 grid squares).
##D 
##D look <- FeatureFinder( hold, smoothpar = 10.5, thresh = 5,
##D     min.size = 700, max.size = 2000 )
##D 
##D look
##D 
##D plot( look )
##D 
##D # Find features according to Wernli et al. (2008).
##D look <- FeatureFinder( hold, thresh = 5, do.smooth = FALSE, fac = 1 / 15 )
##D 
##D look
##D 
##D plot( look )
##D 
##D # Now do a mix of the two types of methods.
##D look <- FeatureFinder( hold, smoothpar = 10.5, thresh = 5, fac = 1 / 15 )
##D 
##D look
##D 
##D plot( look )
##D 
## End(Not run)



