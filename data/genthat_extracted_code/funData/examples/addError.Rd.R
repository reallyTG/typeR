library(funData)


### Name: addError
### Title: Add Gaussian white noise to functional data objects
### Aliases: addError

### ** Examples

oldPar <- par(no.readonly = TRUE)
set.seed(1)

# Univariate functional data
plain <- simFunData(argvals = seq(0,1,0.01), M = 10, eFunType = "Fourier",
                    eValType = "linear", N = 1)$simData
noisy <- addError(plain , sd = 0.5)
veryNoisy <- addError(plain, sd = 2)

plot(plain, main = "Add error", ylim = range(veryNoisy@X))
plot(noisy, type = "p", pch = 20, add = TRUE)
plot(veryNoisy, type = "p", pch = 4, add = TRUE)
legend("topright", c("Plain", "Noisy", "Very Noisy"), lty = c(1, NA, NA), pch = c(NA, 20 ,4))

# Multivariate functional data
plain <- simMultiFunData(type = "split", argvals = list(seq(0,1,0.01), seq(-.5,.5,0.02)), M = 10,
                        eFunType = "Fourier", eValType = "linear", N = 1)$simData
noisy <- addError(plain , sd = 0.5)
veryNoisy <- addError(plain, sd = 2)

par(mfrow = c(1,2))
plot(plain[[1]], main = "Add error (multivariate)", ylim = range(veryNoisy[[1]]@X))
plot(noisy[[1]], type = "p", pch = 20, add = TRUE)
plot(veryNoisy[[1]], type = "p", pch = 4, add = TRUE)

plot(plain[[2]], main = "Add error (multivariate)", ylim = range(veryNoisy[[2]]@X))
plot(noisy[[2]], type = "p", pch = 20, add = TRUE)
plot(veryNoisy[[2]], type = "p", pch = 4, add = TRUE)
legend("topright", c("Plain", "Noisy", "Very Noisy"), lty = c(1, NA, NA), pch = c(NA, 20 ,4))

par(oldPar)



