library(ade4)


### Name: mbpcaiv
### Title: Multiblock principal component analysis with instrumental
###   variables
### Aliases: mbpcaiv
### Keywords: multivariate

### ** Examples

data(chickenk)
Mortality <- chickenk[[1]]
dudiY.chick <- dudi.pca(Mortality, center = TRUE, scale = TRUE, scannf =
FALSE)
ktabX.chick <- ktab.list.df(chickenk[2:5])
resmbpcaiv.chick <- mbpcaiv(dudiY.chick, ktabX.chick, scale = TRUE,
option = "uniform", scannf = FALSE)
summary(resmbpcaiv.chick)
if(adegraphicsLoaded())
plot(resmbpcaiv.chick)



