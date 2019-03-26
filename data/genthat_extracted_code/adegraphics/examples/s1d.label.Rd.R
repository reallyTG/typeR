library(adegraphics)


### Name: s1d.label
### Title: 1-D plot of a numeric score with labels
### Aliases: s1d.label
### Keywords: aplot hplot

### ** Examples

data(meau, package = "ade4")
envpca <- ade4::dudi.pca(meau$env, scannf = FALSE)
g1 <- s1d.label(envpca$l1[, 1], row.names(envpca$l1), plot = FALSE)
g2 <- s1d.label(envpca$co[, 1], row.names(envpca$co), p1d.reverse = TRUE, plot = FALSE)
G <- ADEgS(c(g1, g2), layout = c(2, 1))      



