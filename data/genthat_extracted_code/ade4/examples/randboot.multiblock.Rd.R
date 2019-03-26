library(ade4)


### Name: randboot.multiblock
### Title: Bootstraped simulations for multiblock methods
### Aliases: randboot.multiblock
### Keywords: multivariate

### ** Examples

data(chickenk)
Mortality <- chickenk[[1]]
dudiY.chick <- dudi.pca(Mortality, center = TRUE, scale = TRUE, scannf =
FALSE)
ktabX.chick <- ktab.list.df(chickenk[2:5])
resmbpcaiv.chick <- mbpcaiv(dudiY.chick, ktabX.chick, scale = TRUE,
option = "uniform", scannf = FALSE, nf = 4)
## nrepet should be higher for a real analysis
test <- randboot(resmbpcaiv.chick, optdim = 4, nrepet = 10)
test
if(adegraphicsLoaded())
plot(test$bipc) 



