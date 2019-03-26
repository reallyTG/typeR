library(SpatialVx)


### Name: Aindex
### Title: Area Index
### Aliases: Aindex Aindex.default Aindex.SpatialVx
### Keywords: math

### ** Examples

# Gemetric shape that is highly structured.
data( "geom000" )

Aindex( geom000 )
Aindex( geom000, dx = 4, dy = 4 )

## Not run: 
##D # Two separate areas with highly structured shapes, but far away from each other.
##D data( "pert000" )
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
##D Aindex( hold, thresh = 20, dx = 4, dy = 4 )
##D 
## End(Not run)



