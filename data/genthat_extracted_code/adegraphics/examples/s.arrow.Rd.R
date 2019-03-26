library(adegraphics)


### Name: s.arrow
### Title: 2-D scatter plot with arrows
### Aliases: s.arrow
### Keywords: aplot hplot

### ** Examples

data(doubs, package = "ade4") 
dudi1 <- ade4::dudi.pca(doubs$env, scale = TRUE, scannf = FALSE, nf = 3)
dudi2 <- ade4::dudi.pca(doubs$fish, scale = TRUE, scannf = FALSE, nf = 2)
coin1 <- ade4::coinertia(dudi1, dudi2, scannf = FALSE, nf = 2)
g11 <- s.arrow(coin1$l1, plabels.cex = 0.87, plot = FALSE)
g12 <- s.arrow(coin1$c1, plabels.cex = 1, plabels.col = "red", plot = FALSE)
g1 <- superpose(g12, g11, plot = TRUE)

xy <- cbind(rnorm(50), rnorm(50))
g2 <- s.arrow(xy, plabels.cex = 0.9, plines = list(lwd = 1.5), parrows.angle = 20)
update(g2, plines = list(col = rainbow(5)))



