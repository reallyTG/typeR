library(adegraphics)


### Name: s1d.class
### Title: 1-D plot of a numeric score partitioned in classes (levels of a
###   factor)
### Aliases: s1d.class
### Keywords: aplot hplot

### ** Examples

data(meau, package = "ade4")
envpca <- ade4::dudi.pca(meau$env, scannf = FALSE)

g1 <- s1d.class(envpca$li[, 1], meau$design$season, poslabel = "value", col = 1:4, plot = FALSE)
g2 <- s1d.class(envpca$li[, 1], meau$design$season, poslabel = "regular", col = 1:6, 
  p1d.reverse = TRUE, plot = FALSE)
ADEgS(c(g1, g2), layout = c(2, 1))

g3 <- s1d.class(envpca$li[, 1], meau$design$season, poslabel = "value", col = 1:4, 
  plabels.cex = 0, key = list(space = "bottom"))



