library(Rknots)


### Name: PCAProjection
### Title: Two-dimensional projection by Principal Component Analysis
### Aliases: PCAProjection
### Keywords: utilities

### ** Examples

## Not run: 
##D protein <- loadProtein('3MDZ')
##D par(mfrow = c(1,2))
##D plotDiagram(protein$A, ends = c(), lwd = 2.5, main = 'Original')
##D 
##D protein.rot <- PCAProjection(protein$A)
##D plotDiagram(protein.rot, ends = c(), lwd = 2.5, main = 'Reduced')
## End(Not run)



