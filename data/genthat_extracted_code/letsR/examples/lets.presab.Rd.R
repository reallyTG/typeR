library(letsR)


### Name: lets.presab
### Title: Create a presence-absence matrix of species' geographic ranges
###   within a grid
### Aliases: lets.presab

### ** Examples

## Not run: 
##D # Spatial distribution polygons of south american frogs 
##D # of genus Phyllomedusa. 
##D data(Phyllomedusa)
##D PAM <- lets.presab(Phyllomedusa, xmn = -93, xmx = -29,
##D                    ymn = -57, ymx = 15)
##D summary(PAM)
##D # Species richness map
##D plot(PAM, xlab = "Longitude", ylab = "Latitude",
##D      main = "Phyllomedusa species richness")
##D # Map of the specific species      
##D plot(PAM, name = "Phyllomedusa nordestina")
## End(Not run)





