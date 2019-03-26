library(SpatialVx)


### Name: MergeForce
### Title: Force Merges in Matched Feature Objects
### Aliases: MergeForce
### Keywords: manip

### ** Examples

x <- y <- matrix(0, 100, 100)
x[2:3,c(3:6, 8:10)] <- 1
y[c(4:7, 9:10),c(7:9, 11:12)] <- 1

x[30:50,45:65] <- 1
y[c(22:24, 99:100),c(50:52, 99:100)] <- 1

hold <- make.SpatialVx( x, y, field.type="contrived", units="none",
    data.name = "Example", obs.name = "x", model.name = "y" )

look <- FeatureFinder(hold, smoothpar=0.5)

look2 <- centmatch( look )

look2

look2 <- MergeForce( look2 )

look2

# plot( look2 )

## Not run: 
##D look3 <- deltamm( look, N = 201 )
##D look3 <- MergeForce( look3 )
##D 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004,
##D     loc=ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units="mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D look <- FeatureFinder(hold, smoothpar=10.5, thresh = 5)
##D 
##D look2 <- centmatch( look, verbose = TRUE )
##D 
##D look2 <- MergeForce( look2 )
##D 
##D plot( look2 )
##D 
##D    
## End(Not run)




