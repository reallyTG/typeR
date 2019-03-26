library(nat)


### Name: coord2ind
### Title: Find 1D indices into a 3D image given spatial coordinates
### Aliases: coord2ind coord2ind.default

### ** Examples

coord2ind(cbind(1,2,3), imdims = c(1024,512,218), 
  voxdims = c(0.622088, 0.622088, 0.622088), origin = c(0,0,0))
## Not run: 
##D ## repeat but using a templatebrain object to specify the coordinate system
##D library(nat.flybrains)
##D coord2ind(cbind(1,2,3), JFRC2)
## End(Not run)



