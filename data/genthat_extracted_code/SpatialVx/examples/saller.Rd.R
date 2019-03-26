library(SpatialVx)


### Name: saller
### Title: Feature-based Analysis of a Field (Image)
### Aliases: saller print.saller summary.saller
### Keywords: math

### ** Examples


data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx
xhat <- ExampleSpatialVxSet$fcst

q <- mean( c(c(x[x>0]),c(xhat[xhat>0])), na.rm=TRUE)

hold <- make.SpatialVx( x, xhat, field.type="contrived", units="none",
    data.name = "Example", obs.name = "x", model.name = "xhat" )

hold2 <- FeatureFinder(hold, smoothpar=5, thresh=q)
## Not run: plot(hold2)

look <- saller(hold2)   
summary(look)

## Not run: 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Perturbed ICP Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D look <- FeatureFinder(hold, smoothpar=10.5)
##D summary(look)
##D plot(look)
##D 
##D saller(look)
##D 
##D    
## End(Not run)




