library(SpatialVx)


### Name: Cindex
### Title: Connectivity Index
### Aliases: Cindex Cindex.default Cindex.SpatialVx
### Keywords: math

### ** Examples

data( "geom000" )
Cindex( geom000 )

data( "pert000" )
Cindex( pert000 )

## Not run: 
##D # Two separate areas with highly structured shapes, but far away from each other.
##D data( "pert006" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx(pert000, pert006, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert006" )
##D 
##D plot( hold )
##D 
##D Cindex( hold )
## End(Not run)




