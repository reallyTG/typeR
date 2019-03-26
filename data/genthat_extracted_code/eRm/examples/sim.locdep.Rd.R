library(eRm)


### Name: sim.locdep
### Title: Simulation locally dependent items
### Aliases: sim.locdep
### Keywords: models

### ** Examples


#simulating locally-dependent data
#500 persons, 10 items, inter-item correlation of 0.5
X <- sim.locdep(500, 10, it.cor = 0.5)

#500 persons, 4 items, correlation matrix specified
sigma <- matrix(c(1,0.2,0.2,0.3,0.2,1,0.4,0.1,0.2,0.4,1,0.8,0.3,0.1,0.8,1),
   ncol = 4)
X <- sim.locdep(500, 4, it.cor = sigma)



