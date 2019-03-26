library(rEDM)


### Name: tde_gp
### Title: (univariate) Time-Delay Embedding forecasting using Gaussian
###   Processes
### Aliases: tde_gp

### ** Examples

data("two_species_model")
ts <- two_species_model$x[1:200]
tde_gp(ts, lib = c(1, 100), pred = c(101, 200), E = 5)




