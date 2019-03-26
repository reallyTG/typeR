library(SpatialVx)


### Name: Sindex
### Title: Shape Index
### Aliases: Sindex Sindex.default Sindex.SpatialVx
### Keywords: math

### ** Examples

# Re-create Fig. 7a from AghaKouchak et al. (2011).
tmp <- matrix(0, 8, 8)
tmp[3,2:4] <- 1
tmp[5,4:6] <- 1
tmp[7,6:7] <- 1
Sindex(tmp)

## Not run: 
##D # Two separate areas with highly structured shapes, but far away from each other.
##D data( "pert000" )
##D data( "pert006" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert006, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert006" )
##D 
##D plot( hold )
##D 
##D Sindex( hold )
## End(Not run)




