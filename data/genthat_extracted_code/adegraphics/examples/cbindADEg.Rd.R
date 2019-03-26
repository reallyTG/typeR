library(adegraphics)


### Name: cbindADEg
### Title: Combine 'ADEg' objects by columns or rows
### Aliases: cbindADEg rbindADEg cbindADEg-methods rbindADEg-methods
###   cbindADEg,ADEgORADEgSORtrellis,ADEgORADEgSORtrellis-method
###   rbindADEg,ADEgORADEgSORtrellis,ADEgORADEgSORtrellis-method
### Keywords: hplot

### ** Examples

data(jv73, package = "ade4")
pca1 <- ade4::dudi.pca(jv73$morpho, scannf = FALSE)
g1 <- s.label(pca1$li, plabels.optim = TRUE, plot = FALSE)
g2 <- s.class(pca1$li, jv73$fac.riv, starSize = 0, ellipseSize = 0, chullSize = 1, 
  ppolygons.alpha = 0.4, col = rainbow(12), ppoints.cex = 0, plot = FALSE)
g3 <- s.corcircle(pca1$co, pbackground.box = FALSE, plot = FALSE)
g4 <- rbindADEg(cbindADEg(g1, g2), cbindADEg(superpose(g1, g2), g3), plot = TRUE)



