library(ade4)


### Name: rpjdl
### Title: Avifauna and Vegetation
### Aliases: rpjdl
### Keywords: datasets

### ** Examples

## Not run: 
##D data(rpjdl)
##D coa1 <- dudi.coa(rpjdl$fau, scann = FALSE)
##D pca1 <- dudi.pca(rpjdl$fau, scal = FALSE, scann = FALSE)
##D 
##D if(adegraphicsLoaded()) {
##D   g1 <- s.distri(coa1$l1, rpjdl$fau, xax = 2, yax = 1, starSize = 0.3, 
##D                  ellipseSize = 0, plab.cex = 0)
##D   g2 <- s.distri(pca1$l1, rpjdl$fau, xax = 2, yax = 1, starSize = 0.3, 
##D                  ellipseSize = 0, plab.cex = 0)
##D } else {
##D   s.distri(coa1$l1, rpjdl$fau, 2, 1, cstar = 0.3, cell = 0)
##D   s.distri(pca1$l1, rpjdl$fau, 2, 1, cstar = 0.3, cell = 0)
##D }
##D 
##D caiv1 <- pcaiv(coa1, rpjdl$mil, scan = FALSE)
##D plot(caiv1)
## End(Not run)


