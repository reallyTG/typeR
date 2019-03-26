library(vamc)


### Name: genIndexScen
### Title: Simulate a 3D array, numScen by numIndex by numStep, of
###   Black-Scholes return factors for numIndex indices in each of numStep
###   time steps and each of numScen scenarios. Covariances among indices
###   are specified in covMatrix. Stepsize is given is dT and interpolated
###   discount factors are given in vDF. Random seed is optional for
###   reproducibility.
### Aliases: genIndexScen

### ** Examples

genIndexScen(mCov, 100, 360, indexNames, 1 / 12, cForwardCurve, 1)



