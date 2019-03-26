library(FactoClass)


### Name: plotcc
### Title: Correlation circle from coordinates
### Aliases: plotcc
### Keywords: multivariate hplot

### ** Examples

data(admi)
pca <- dudi.pca(admi[,2:6],scannf=FALSE,nf=2)
# fullcircle
plotcc(pca$co)
# no fullcircle
plotcc(pca$co,fullcircle=FALSE)



