library(ALA4R)


### Name: intersect_points
### Title: Intersect environmental or contextual layers at a given a set of
###   points (coordinates)
### Aliases: intersect_points

### ** Examples

## Not run: 
##D  ## single point with multiple layers
##D  layers <- c("cl22", "cl23", "el773")
##D  pnts <- c(-23.1, 149.1)
##D  intersect_points(pnts, layers)
##D 
##D  ## equivalent direct web service call:
##D  ## http://spatial.ala.org.au/ws/intersect/cl22,cl23,el773/-23.1/149.1  
##D 
##D  ## multiple points as a grid sampling multiple layers
##D  layers <- c("cl22", "cl23", "el773")
##D  pnts <- data.frame(expand.grid(lat=seq(-29, -19, by=2), lon=seq(130, 140, by=2)))
##D  intersect_points(pnts, layers)
## End(Not run)



