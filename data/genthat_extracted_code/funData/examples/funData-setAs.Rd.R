library(funData)


### Name: funData-setAs
### Title: Coerce a funData object to class multiFunData
### Aliases: funData-setAs funData-setAs
### Keywords: internal

### ** Examples

# create funData object with 5 observations
f <- simFunData(N = 5, M = 7, eValType = "linear",
                eFunType = "Fourier", argvals = seq(0,1,0.01))$simData

# sparsify artificially
fSparse <- sparsify(f, minObs = 4, maxObs = 10)

# coerce to irregFunData object
i <- as.irregFunData(fSparse)
i



