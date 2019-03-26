library(ade4)


### Name: dudi
### Title: Duality Diagram
### Aliases: dudi as.dudi print.dudi t.dudi is.dudi redo.dudi summary.dudi
###   [.dudi
### Keywords: multivariate

### ** Examples

data(deug)
dd1 <- dudi.pca(deug$tab, scannf = FALSE)
dd1
t(dd1)
is.dudi(dd1)
redo.dudi(dd1,3)
summary(dd1)



