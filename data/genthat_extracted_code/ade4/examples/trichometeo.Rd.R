library(ade4)


### Name: trichometeo
### Title: Pair of Ecological Data
### Aliases: trichometeo
### Keywords: datasets

### ** Examples

data(trichometeo)
faulog <- log(trichometeo$fau + 1)
pca1 <- dudi.pca(trichometeo$meteo, scan = FALSE)
niche1 <- niche(pca1, faulog, scan = FALSE)

if(adegraphicsLoaded()) {
  g1 <- s.distri(niche1$ls, faulog, plab.cex = 0.6, ellipseSize = 0, starSize = 0.3, plot = FALSE)
  g2 <- s.arrow(7 * niche1$c1, plab.cex = 1, plot = FALSE)
  G <- superpose(g1, g2, plot = TRUE)
  
} else {
  s.label(niche1$ls, clab = 0)
  s.distri(niche1$ls, faulog, clab = 0.6, add.p = TRUE, cell = 0, csta = 0.3)
  s.arrow(7 * niche1$c1, clab = 1, add.p = TRUE)
}


