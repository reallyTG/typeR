library(funData)


### Name: sparsify
### Title: Generate a sparse version of functional data objects
### Aliases: sparsify

### ** Examples

oldPar <- par(no.readonly = TRUE)
par(mfrow = c(1,1))
set.seed(1)

# univariate functional data
full <- simFunData(argvals = seq(0,1, 0.01), M = 10, eFunType = "Fourier",
                   eValType = "linear", N = 3)$simData
sparse <- sparsify(full, minObs = 4, maxObs = 10)

plot(full, main = "Sparsify")
plot(sparse, type = "p", pch = 20, add = TRUE)
legend("topright", c("Full", "Sparse"), lty = c(1, NA), pch = c(NA, 20))

# Multivariate
full <- simMultiFunData(type = "split", argvals = list(seq(0,1, 0.01), seq(-.5,.5, 0.02)),
                        M = 10, eFunType = "Fourier", eValType = "linear", N = 3)$simData
sparse <- sparsify(full, minObs = c(4, 30), maxObs = c(10, 40))

par(mfrow = c(1,2))
plot(full[[1]], main = "Sparsify (multivariate)", sub = "minObs = 4, maxObs = 10")
plot(sparse[[1]], type = "p", pch = 20, add = TRUE)

plot(full[[2]], main = "Sparsify (multivariate)", sub = "minObs = 30, maxObs = 40")
plot(sparse[[2]], type = "p", pch = 20, add = TRUE)
legend("bottomright", c("Full", "Sparse"), lty = c(1, NA), pch = c(NA, 20))

par(oldPar)



