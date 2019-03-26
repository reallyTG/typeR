library(adehabitatMA)


### Name: explore
### Title: Interactive Exploration of Maps of Class
###   'SpatialPixelsDataFrame' (requires the package tkrplot)
### Aliases: explore
### Keywords: hplot spatial

### ** Examples

## Not run: 
##D 
##D data(meuse.grid)
##D m <- SpatialPixelsDataFrame(points = meuse.grid[c("x", "y")],
##D                             data = meuse.grid)
##D explore(m[,3:5])
##D 
##D data(lynxjura)
##D explore(lynxjura$map, panel.last=function() points(lynxjura$locs))
##D 
##D 
## End(Not run)



