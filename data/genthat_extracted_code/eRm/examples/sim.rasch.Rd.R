library(eRm)


### Name: sim.rasch
### Title: Simulation of Rasch homogeneous data
### Aliases: sim.rasch
### Keywords: models

### ** Examples


#simulating Rasch homogenous data
#100 persons, 10 items, parameter drawn from N(0,1)
X <- sim.rasch(100, 10)

#person parameters drawn from uniform distribution, fixed cutpoint
ppar <- runif(100,-2,2)
X <- sim.rasch(ppar, 10, cutpoint = 0.5)



