library(ChemometricsWithR)


### Name: PCA.plot
### Title: Principal Component Analysis plotting functions
### Aliases: plot.PCA scoreplot loadingplot scoreplot.PCA loadingplot.PCA
###   screeplot biplot.PCA
### Keywords: hplot

### ** Examples

data(wines, package = "kohonen")
wines.PC <- PCA(scale(wines))
wine.classes <- as.integer(vintages)
scoreplot(wines.PC, col = wine.classes, pch = wine.classes)
loadingplot(wines.PC, show.names = TRUE)
biplot(wines.PC, score.col = wine.classes)
screeplot(wines.PC)



