library(funData)


### Name: Math.funData
### Title: Mathematical operations for functional data objects
### Aliases: Math.funData Math,funData-method Math,multiFunData-method
###   Math,irregFunData-method

### ** Examples

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1,2))

# simulate a funData object on 0..1 with 10 observations
argvals <- seq(0, 1, 0.01)
f <- simFunData(argvals = argvals, N = 10, 
                M = 5, eFunType = "Fourier", eValType = "linear")$simData

### FunData
plot(f, main = "Original data")
plot(abs(f), main = "Absolute values")

### Irregular
# create an irrgFunData object by sparsifying f
i <- as.irregFunData(sparsify(f, minObs = 5, maxObs = 10))

plot(i, main = "Sparse data")
plot(cumsum(i), main = "'cumsum' of sparse data")

### Multivariate
m <- multiFunData(f, -1*f)
plot(m, main = "Multivariate Data")
plot(exp(m), main = "Exponential")

par(oldpar)



