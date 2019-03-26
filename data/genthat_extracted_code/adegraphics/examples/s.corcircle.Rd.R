library(adegraphics)


### Name: s.corcircle
### Title: Correlation circle
### Aliases: s.corcircle
### Keywords: aplot hplot

### ** Examples

data (olympic, package = "ade4")
dudi1 <- ade4::dudi.pca(olympic$tab, scannf = FALSE)
g1 <- s.corcircle(dudi1$co)
g2 <- s.corcircle(dudi1$co, fullcircle = FALSE, pback.col = "grey")



