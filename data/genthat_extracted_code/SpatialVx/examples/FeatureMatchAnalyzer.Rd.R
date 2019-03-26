library(SpatialVx)


### Name: FeatureMatchAnalyzer
### Title: Analyze Features of a Verification Set
### Aliases: FeatureMatchAnalyzer FeatureMatchAnalyzer.matched.centmatch
###   FeatureMatchAnalyzer.matched.deltamm plot.FeatureMatchAnalyzer
###   print.FeatureMatchAnalyzer summary.FeatureMatchAnalyzer FeatureComps
###   distill.FeatureComps
### Keywords: math

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx
xhat <- ExampleSpatialVxSet$fcst

hold <- make.SpatialVx( x, xhat, field.type="Example",
    units = "units", data.name = "Example", 
    obs.name = "x", model.name = "xhat" )

look <- FeatureFinder(hold, smoothpar=1.5)
look2 <- centmatch(look)

tmp <- FeatureMatchAnalyzer(look2)
tmp
summary(tmp)
plot(tmp)


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
##D look2 <- centmatch(look)
##D tmp <- FeatureMatchAnalyzer(look2)
##D summary(tmp)
##D plot(tmp)
##D    
## End(Not run)




