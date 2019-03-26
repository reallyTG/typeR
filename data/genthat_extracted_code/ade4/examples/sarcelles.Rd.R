library(ade4)


### Name: sarcelles
### Title: Array of Recapture of Rings
### Aliases: sarcelles
### Keywords: datasets

### ** Examples

## Not run: 
##D if(!adegraphicsLoaded()) {
##D   # depends of pixmap
##D   if(requireNamespace("pixmap", quietly = TRUE)) {
##D     bkgnd.pnm <- pixmap::read.pnm(system.file("pictures/sarcelles.pnm", package = "ade4"))
##D     data(sarcelles)
##D     par(mfrow = c(4, 3))
##D     for(i in 1:12) {
##D       s.distri(sarcelles$xy, sarcelles$tab[, i], pixmap = bkgnd.pnm, 
##D        sub = sarcelles$col.names[i], clab = 0, csub = 2)
##D       s.value(sarcelles$xy, sarcelles$tab[, i], add.plot = TRUE, cleg = 0)
##D     }
##D     par(mfrow = c(1, 1))
##D   }
##D }
## End(Not run)


