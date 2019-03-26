library(MFPCA)


### Name: fpcaBasis
### Title: Calculate a functional principal component basis representation
###   for functional data on one-dimensional domains
### Aliases: fpcaBasis
### Keywords: internal

### ** Examples

# simulate N = 100 observations of functional data based on polynomial eigenfunctions on [0,1]
sim <- simFunData(argvals = seq(0,1,0.01), M = 5, eFunType = "Poly", eValType = "linear", N = 100)

# estimate the first 5 functional principal components from the data
fpca <- MFPCA:::fpcaBasis(sim$simData, npc = 5)

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1,2))
plot(sim$trueFuns, obs = 1:5, main = "True eigenfunctions")
plot(fpca$functions, main = "Estimated eigenfunctions")

# Flip if necessary
plot(sim$trueFuns, obs = 1:5, main = "True eigenfunctions")
plot(flipFuns(sim$trueFuns[1:5], fpca$functions),
     main = "Estimated eigenfunctions\n(flipped)")

par(oldpar)



