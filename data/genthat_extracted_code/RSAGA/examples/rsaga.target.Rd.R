library(RSAGA)


### Name: rsaga.target
### Title: Define target grid for interpolation
### Aliases: rsaga.target
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # IDW interpolation of attribute "z" from the point shapefile
##D # 'points.shp' to a grid with the same extent and resolution
##D # as the (pre-existing) geology grid:
##D rsaga.inverse.distance("points", "dem", field = "z", maxdist = 1000,
##D     target = rsaga.target(target="target.grid",
##D     target.grid = "geology"))
## End(Not run)



