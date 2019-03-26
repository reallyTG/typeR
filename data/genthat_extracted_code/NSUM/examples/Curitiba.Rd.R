library(NSUM)


### Name: Curitiba
### Title: Curitiba Dataset
### Aliases: Curitiba
### Keywords: datasets

### ** Examples

## load data
data(Curitiba)

## simulate from model with transmission bias
sim.trans <- with(Curitiba, nsum.simulate(100, known, unknown, N, model="transmission", 
                                          mu, sigma, tauK))



