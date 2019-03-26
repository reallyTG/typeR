library(ade4)


### Name: olympic
### Title: Olympic Decathlon
### Aliases: olympic
### Keywords: datasets

### ** Examples

data(olympic)
pca1 <- dudi.pca(olympic$tab, scan = FALSE)

if(adegraphicsLoaded()) {
  if(requireNamespace("lattice", quietly = TRUE)) {
    g1 <- s1d.barchart(pca1$eig, p1d.hori = FALSE, plot = FALSE)
    g2 <- s.corcircle(pca1$co, plot = FALSE)
    g3 <- lattice::xyplot(pca1$l1[, 1] ~ olympic$score, type = c("p", "r"))
    g41 <- s.label(pca1$l1, plab.cex = 0.5, plot = FALSE)
    g42 <- s.arrow(2 * pca1$co, plot = FALSE)
    g4 <- superpose(g41, g42)
    G <- ADEgS(list(g1, g2, g3, g4), layout = c(2, 2))
  }
  
} else {
  par(mfrow = c(2, 2))
  barplot(pca1$eig)
  s.corcircle(pca1$co)
  plot(olympic$score, pca1$l1[, 1])
  abline(lm(pca1$l1[, 1] ~ olympic$score))
  s.label(pca1$l1, clab = 0.5)
  s.arrow(2 * pca1$co, add.p = TRUE)
  par(mfrow = c(1, 1))
}


