library(SpatialVx)


### Name: FeatureAxis
### Title: Major and Minor Axes of a Feature
### Aliases: FeatureAxis plot.FeatureAxis summary.FeatureAxis
### Keywords: math graphs

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx

look <- disk2dsmooth(x,5)
u <- quantile(look,0.99)
sIx <- matrix(0, 100, 100)
sIx[ look > u] <- 1
look2 <- disjointer(sIx)[[1]]
look2 <- flipxy(look2)
tmp <- FeatureAxis(look2)
plot(tmp)
summary(tmp)

## Not run: 
##D data( "pert000" )
##D data( "pert004" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004,
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE,
##D     loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Perturbed ICP Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D look <- FeatureFinder(hold, smoothpar=10.5)
##D par(mfrow=c(1,2))
##D plot(look)
##D 
##D par(mfrow=c(2,2))
##D image.plot(look$X.labeled)
##D image.plot(look$Y.labeled)
##D 
##D # The next line will likely be very slow.
##D look2 <- deltamm(x=look, verbose=TRUE)
##D image.plot(look2$X.labeled)
##D image.plot(look2$Y.labeled)
##D 
##D look2$mm.new.labels # the first seven features are matched.
##D 
##D ang1 <- FeatureAxis(look2$X.feats[[1]])
##D ang2 <- FeatureAxis(look2$Y.feats[[1]])
##D plot(ang1)
##D plot(ang2)
##D summary(ang1)
##D summary(ang2)
##D 
##D ang3 <- FeatureAxis(look2$X.feats[[4]])
##D ang4 <- FeatureAxis(look2$Y.feats[[4]])
##D plot(ang3)
##D plot(ang4)
##D summary(ang3)
##D summary(ang4)
##D    
## End(Not run)




