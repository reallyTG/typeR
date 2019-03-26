library(SpatialVx)


### Name: fss2dPlot
### Title: Create Several Graphics for List Objects Returned from hoods2d
### Aliases: fss2dPlot upscale2dPlot
### Keywords: hplot

### ** Examples

##
## This is effectively an internal function, so the example is commented out
## in order for R's check to run faster.
##
## Not run: 
##D data( "geom001" )
##D data( "geom000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.01,50.01),
##D     loc = ICPg240Locs, map = TRUE, projection = TRUE, loc.byrow = TRUE,
##D     units = "mm/h", data.name = "Geometric", obs.name = "observation",
##D     model.name = "case 1" )
##D 
##D look <- hoods2d(hold, levels=c(1, 3, 5, 33, 65),
##D     verbose=TRUE)
##D plot( look)
## End(Not run)



