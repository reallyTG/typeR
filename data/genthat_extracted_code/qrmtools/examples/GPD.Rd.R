library(qrmtools)


### Name: GPD
### Title: (Generalized) Pareto Distribution
### Aliases: dGPD pGPD qGPD rGPD dPar pPar qPar rPar
### Keywords: distribution

### ** Examples

## Basic sanity checks
curve(dGPD(x, shape = 0.5, scale = 3), from = -1, to = 5)
plot(pGPD(rGPD(1000, shape = 0.5, scale = 3), shape = 0.5, scale = 3)) # should be U[0,1]



