library(RSAGA)


### Name: rsaga.grid.to.points
### Title: Convert SAGA grid file to point shapefile
### Aliases: rsaga.grid.to.points rsaga.grid.to.points.randomly
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # one point per grid cell, exclude nodata areas:
##D rsaga.grid.to.points("dem", "dempoints")
##D # take only every 20th point, but to not exclude nodata areas:
##D rsaga.grid.to.points.randomly("dem", "dempoints20", freq = 20)
## End(Not run)



