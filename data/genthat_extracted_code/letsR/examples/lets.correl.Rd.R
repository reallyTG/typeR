library(letsR)


### Name: lets.correl
### Title: Compute correlogram based on the Moran's I index
### Aliases: lets.correl

### ** Examples

## Not run: 
##D data(PAM)
##D data(IUCN)
##D 
##D # Spatial autocorrelation in description year (species level)
##D midpoint <- lets.midpoint(PAM)
##D distan <- lets.distmat(midpoint[, 2:3])
##D moran <- lets.correl(IUCN$Description, distan, 12,
##D                      equidistant = FALSE, 
##D                      plot = TRUE)
##D                      
## End(Not run)




