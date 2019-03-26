library(raster)


### Name: terrain
### Title: Terrain characteristics
### Aliases: terrain
### Keywords: spatial

### ** Examples

## Not run: 
##D elevation <- getData('alt', country='CHE')
##D x <- terrain(elevation, opt=c('slope', 'aspect'), unit='degrees')
##D plot(x)
##D 
##D 
##D # TPI for different neighborhood size:
##D tpiw <- function(x, w=5) {
##D 	m <- matrix(1/(w^2-1), nc=w, nr=w)
##D 	m[ceiling(0.5 * length(m))] <- 0
##D 	f <- focal(x, m)
##D 	x - f
##D }
##D tpi5 <- tpiw(elevation, w=5)
## End(Not run)



