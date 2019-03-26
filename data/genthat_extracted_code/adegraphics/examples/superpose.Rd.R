library(adegraphics)


### Name: superpose
### Title: Superpose two graphics
### Aliases: superpose superpose-methods
###   superpose,ADEgORtrellis,ADEgORtrellis,ANY,ANY-method
###   superpose,ADEgS,ADEgORtrellis,numeric,logical-method
###   superpose,ADEgS,ADEgORtrellis,numeric,ANY-method
###   superpose,ADEgS,ADEgORtrellis,missing,ANY-method
###   superpose,ADEgS,ADEgS,missing,ANY-method +-methods \S4method{+}{ADEg}
###   +,ADEg,ADEg-method +,ADEg,ADEgS-method +,ADEgS,ADEg-method
### Keywords: hplot methods

### ** Examples

cha <- LETTERS[1:20]
xy <- cbind.data.frame(runif(length(cha)), runif(length(cha)))
g1 <- s.label(xy, labels = cha, ppoints.alpha = 0, pbackground.col = "grey85")
g2 <- s.label(xy, labels = cha, plabels.cex = 0, paxes.draw = TRUE, ppoints.pch = 4, 
  ppoints.col = "red")
g3 <- superpose(g1, g2, plot = TRUE)
g4 <- superpose(g2, g1, plot = TRUE)

data(jv73, package = "ade4")
pca1 <- ade4::dudi.pca(jv73$morpho, scannf = FALSE)
g5 <- s.label(pca1$li, plabels.optim = TRUE)
g6 <- s.class(pca1$li, jv73$fac.riv, starSize = 0, ellipseSize = 0, chullSize = 1, 
  ppolygons.alpha = 0.4, col = rainbow(12), ppoints.cex = 0)
g5 + g6

## Not run: 
##D g7 <- s.label(pca1$li, plabels.optim = TRUE, facets = jv73$fac.riv, plot = FALSE)
##D g8 <- s.class(pca1$li, jv73$fac.riv, facets = jv73$fac.riv, starSize = 0, chullSize = 1, 
##D   ellipseSize = 0, ppolygons.alpha = 0.4, col = rainbow(12), ppoints.cex = 0, plot = FALSE)
##D g9 <- superpose(g7, g8, plot = TRUE)
## End(Not run)



