library(adegraphics)


### Name: s1d.gauss
### Title: 1-D plot of a numeric score by Gaussian curves
### Aliases: s1d.gauss
### Keywords: aplot hplot

### ** Examples

data(meau, package= "ade4")
envpca <- ade4::dudi.pca(meau$env, scannf = FALSE)
dffac <- cbind.data.frame(meau$design$season, meau$design$site)
g1 <- s1d.gauss(envpca$li[, 1], fac = dffac, fill = TRUE, col = 1:6)
update(g1, steps = 10)
g2 <- s1d.gauss(envpca$li[, 1], dffac[, 2], ppoly.col = 1:4, paxes.draw = TRUE, ylim = c(0, 2), 
  fill = TRUE, p1d.hori = FALSE)



