library(ade4)


### Name: procuste
### Title: Simple Procruste Rotation between two sets of points
### Aliases: procuste plot.procuste print.procuste randtest.procuste
### Keywords: multivariate

### ** Examples

data(macaca)
pro1 <- procuste(macaca$xy1, macaca$xy2, scal = FALSE)
pro2 <- procuste(macaca$xy1, macaca$xy2)
if(adegraphicsLoaded()) {
  g1 <- s.match(pro1$tabX, pro1$rotY, plab.cex = 0.7, plot = FALSE)
  g2 <- s.match(pro1$tabY, pro1$rotX, plab.cex = 0.7, plot = FALSE)
  g3 <- s.match(pro2$tabX, pro2$rotY, plab.cex = 0.7, plot = FALSE)
  g4 <- s.match(pro2$tabY, pro2$rotX, plab.cex = 0.7, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
} else {
  par(mfrow = c(2, 2))
  s.match(pro1$tabX, pro1$rotY, clab = 0.7)
  s.match(pro1$tabY, pro1$rotX, clab = 0.7)
  s.match(pro2$tabX, pro2$rotY, clab = 0.7)
  s.match(pro2$tabY, pro2$rotX, clab = 0.7)
  par(mfrow = c(1,1))
}

data(doubs)
pca1 <- dudi.pca(doubs$env, scal = TRUE, scann = FALSE)
pca2 <- dudi.pca(doubs$fish, scal = FALSE, scann = FALSE)
pro3 <- procuste(pca1$tab, pca2$tab, nf = 2)
if(adegraphicsLoaded()) {
  g11 <- s.traject(pro3$scorX, plab.cex = 0, plot = FALSE)
  g12 <- s.label(pro3$scorX, plab.cex = 0.8, plot = FALSE)
  g1 <- superpose(g11, g12)
  g21 <- s.traject(pro3$scorY, plab.cex = 0, plot = FALSE)
  g22 <- s.label(pro3$scorY, plab.cex = 0.8, plot = FALSE)
  g2 <- superpose(g21, g22)
  g3 <- s.arrow(pro3$loadX, plab.cex = 0.75, plot = FALSE)
  g4 <- s.arrow(pro3$loadY, plab.cex = 0.75, plot = FALSE)
  G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))

} else {
  par(mfrow = c(2, 2))
  s.traject(pro3$scorX, clab = 0)
  s.label(pro3$scorX, clab = 0.8, add.p = TRUE)
  s.traject(pro3$scorY, clab = 0)
  s.label(pro3$scorY, clab = 0.8, add.p = TRUE)
  s.arrow(pro3$loadX, clab = 0.75)
  s.arrow(pro3$loadY, clab = 0.75)
  par(mfrow = c(1, 1))
}

plot(pro3)
randtest(pro3)

data(fruits)
plot(procuste(scalewt(fruits$jug), scalewt(fruits$var)))



