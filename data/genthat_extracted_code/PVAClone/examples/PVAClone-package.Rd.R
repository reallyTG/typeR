library(PVAClone)


### Name: PVAClone-package
### Title: Population Viability Analysis with Data Cloning
### Aliases: PVAClone-package PVAClone pvaclone PVA-package pva-package
###   Pva-package PVA Pva
### Keywords: package

### ** Examples

## Not run: 
##D ## model selection for data with missing observations
##D data(songsparrow)
##D ## model without observation error
##D m1 <- pva(songsparrow, gompertz("none"), 2, n.iter=1000)
##D ## model with Poisson observation error
##D m2 <- pva(songsparrow, gompertz("poisson"), 2, n.iter=1000)
##D ## model with Poisson observation error is strongly supported
##D model.select(m1, m2)
## End(Not run)



