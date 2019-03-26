library(SpatialVx)


### Name: deltamm
### Title: Merge and/or Match Identified Features Within Two Fields
### Aliases: deltamm plot.matched print.matched summary.matched centmatch
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
##D     data.name = "Example", obs.name = "x", model.name = "y" )
##D 
##D look <- FeatureFinder( hold, smoothpar = 0.5 ) 
##D 
##D # The next line fails because the centering pushes one object out of the new domain.
##D # look2 <- deltamm( look )
##D # Setting N larger fixes the problem.
##D look2 <- deltamm( look, N = 300 )
##D look2 <- MergeForce( look2 )
##D 
##D look2
##D 
##D plot( look2 )
##D 
##D FeatureTable(look2)
##D 
##D look3 <- centmatch(look)
##D 
##D FeatureTable(look3)
##D 
##D look3 <- MergeForce( look3 )
##D 
##D plot( look3 )
## End(Not run)
## Not run: 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004,
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004")
##D 
##D look <- FeatureFinder(hold, smoothpar = 10.5, thresh = 5 )
##D 
##D plot( look )
##D 
##D look2 <- deltamm( look, N = 701, verbose = TRUE )
##D 
##D look2
##D 
##D look2 <- MergeForce( look2 )
##D 
##D look2
##D 
##D plot( look2 )
##D 
##D # No false alarm objects, one missed object.
##D FeatureTable( look2 )
##D 
##D    
## End(Not run)




