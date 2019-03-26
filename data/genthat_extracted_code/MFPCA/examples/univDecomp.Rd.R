library(MFPCA)


### Name: univDecomp
### Title: Univariate basis decomposition
### Aliases: univDecomp

### ** Examples

# generate some data
dat <- simFunData(argvals = seq(0,1,0.01), M = 5,
                  eFunType = "Poly", eValType = "linear", N = 100)$simData

# decompose the data in univariate functional principal components...
decFPCA <- univDecomp(type = "uFPCA", funDataObject = dat, npc = 5)
str(decFPCA)

# or in splines (penalized)
decSplines <- univDecomp(type = "splines1Dpen", funDataObject = dat) # use mgcv's default params
str(decSplines)



