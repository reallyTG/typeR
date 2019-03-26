library(qrmtools)


### Name: GEV
### Title: Generalized Extreme Value Distribution
### Aliases: dGEV pGEV qGEV rGEV
### Keywords: distribution

### ** Examples

## Basic sanity checks
plot(pGEV(rGEV(1000, shape = 0.5), shape = 0.5)) # should be U[0,1]
curve(dGEV(x, shape = 0.5), from = -3, to = 5)



