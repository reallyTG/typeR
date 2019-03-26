library(SpatialVx)


### Name: griddedVgram
### Title: Variograms for a Gridded Verification Set
### Aliases: griddedVgram plot.griddedVgram
### Keywords: math

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx
xhat <- ExampleSpatialVxSet$fcst

hold <- make.SpatialVx( x, xhat, field.type = "contrived",
    units="none", data.name = "Example", obs.name = "x",
    model.name = "xhat" )

res <- griddedVgram( hold, R = 8 )
plot( res )

## Not run: 
##D data( "pert004" )
##D data( "pert000" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Perturbed ICP Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D res <- griddedVgram(hold, R=8)
##D plot( res )
## End(Not run)



