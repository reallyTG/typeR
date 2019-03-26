library(dispRity)


### Name: sim.morpho
### Title: Simulates morphological data.
### Aliases: sim.morpho

### ** Examples


set.seed(4)
## A random tree with 15 tips
tree <- rcoal(15)
## Setting up the parameters
my_rates = c(rgamma, rate = 10, shape = 5)
my_substitutions = c(runif, 2, 2)

## HKY binary (15*50)
matrixHKY <- sim.morpho(tree, characters = 50, model = "HKY",
     rates = my_rates, substitution = my_substitutions)

## Mk matrix (15*50) (for Mkv models)
matrixMk <- sim.morpho(tree, characters = 50, model = "ER", rates = my_rates) 

## Mk invariant matrix (15*50) (for Mk models)
matrixMk <- sim.morpho(tree, characters = 50, model = "ER", rates = my_rates,
     invariant = FALSE)

## MIXED model invariant matrix (15*50)
matrixMixed <- sim.morpho(tree, characters = 50, model = "MIXED",
     rates = my_rates, substitution = my_substitutions,  invariant = FALSE,
     verbose = TRUE)




