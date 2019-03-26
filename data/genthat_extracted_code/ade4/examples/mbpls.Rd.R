library(ade4)


### Name: mbpls
### Title: Multiblock partial least squares
### Aliases: mbpls
### Keywords: multivariate

### ** Examples

data(chickenk)
Mortality <- chickenk[[1]]
dudiY.chick <- dudi.pca(Mortality, center = TRUE, scale = TRUE, scannf =
FALSE)
ktabX.chick <- ktab.list.df(chickenk[2:5])
resmbpls.chick <- mbpls(dudiY.chick, ktabX.chick, scale = TRUE,
option = "uniform", scannf = FALSE)
summary(resmbpls.chick)
if(adegraphicsLoaded())
plot(resmbpls.chick)



