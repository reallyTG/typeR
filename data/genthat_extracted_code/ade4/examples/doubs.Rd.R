library(ade4)


### Name: doubs
### Title: Pair of Ecological Tables
### Aliases: doubs
### Keywords: datasets

### ** Examples

data(doubs)
pca1 <- dudi.pca(doubs$env, scan = FALSE)
pca2 <- dudi.pca(doubs$fish, scale = FALSE, scan = FALSE)
coiner1 <- coinertia(pca1, pca2, scan = FALSE)
  
if(adegraphicsLoaded()) {
  g1 <- s.corcircle(coiner1$aX, plot = FALSE)
  g2 <- s.value(doubs$xy, coiner1$lX[, 1], plot = FALSE)
  g3 <- s.value(doubs$xy, coiner1$lX[, 2], plot = FALSE)
  g4 <- s.arrow(coiner1$c1, plot = FALSE)
  g5 <- s.match(coiner1$mX, coiner1$mY, plot = FALSE)
  g6 <- s.corcircle(coiner1$aY, plot = FALSE)
  g7 <- s.arrow(coiner1$l1, plot = FALSE)
  g8 <- s.value(doubs$xy, coiner1$lY[, 1], plot = FALSE)
  g9 <- s.value(doubs$xy, coiner1$lY[, 2], plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4, g5, g6, g7, g8, g9), layout = c(3, 3))
  
} else {  
  par(mfrow = c(3, 3))
  s.corcircle(coiner1$aX)
  s.value(doubs$xy, coiner1$lX[, 1])
  s.value(doubs$xy, coiner1$lX[, 2])
  s.arrow(coiner1$c1)
  s.match(coiner1$mX, coiner1$mY)
  s.corcircle(coiner1$aY)
  s.arrow(coiner1$l1)
  s.value(doubs$xy, coiner1$lY[, 1])
  s.value(doubs$xy, coiner1$lY[, 2])
  par(mfrow = c(1, 1))
}


