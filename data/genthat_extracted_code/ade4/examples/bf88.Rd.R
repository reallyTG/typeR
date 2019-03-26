library(ade4)


### Name: bf88
### Title: Cubic Ecological Data
### Aliases: bf88
### Keywords: datasets

### ** Examples

data(bf88)
fou1 <- foucart(bf88, scann = FALSE, nf = 3)
fou1

if(adegraphicsLoaded()) {
  g1 <- scatter(fou1, plot = FALSE)
  g2 <- s.traject(fou1$Tco, fou1$TC[, 1], plines.lty = 1:length(levels(fou1$TC[, 1])), plot = FALSE)
  g3 <- s.traject(fou1$Tco, fou1$TC[, 2], plines.lty = 1:length(levels(fou1$TC[, 2])), plot = FALSE)
  g41 <- s.label(fou1$Tco, plot = FALSE)
  g42 <- s.label(fou1$co, plab.cex = 2, plot = FALSE)
  g4 <- superpose(g41, g42, plot = FALSE)
  G1 <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  
  G2 <- kplot(fou1, row.plab.cex = 0, psub.cex = 2)

} else {
  par(mfrow = c(2,2))
  scatter(fou1)
  s.traject(fou1$Tco, fou1$TC[, 1])
  s.traject(fou1$Tco, fou1$TC[, 2])
  s.label(fou1$Tco)
  s.label(fou1$co, add.p = TRUE, clab = 2)
  par(mfrow = c(1, 1))
  kplot(fou1, clab.c = 2, clab.r = 0, csub = 3)
}


