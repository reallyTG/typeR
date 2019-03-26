library(spiders)


### Name: spiders-package
### Title: Fits predator preferences model.
### Aliases: spiders-package spiders
### Keywords: spiders

### ** Examples

## make up some numbers
Predators <- 20
Traps <- 20                              
PreySpecies <- 3
Times <- 12
ST <- Times*PreySpecies
l <- matrix(1:ST, nrow=Times, ncol=PreySpecies)
g <- matrix(2*(1:ST), nrow=Times, ncol=PreySpecies)

##  simulate data
fdata <- simPref(PreySpecies, Times, Predators, Traps, l, g)

## calculate model
(prefs <- predPref(fdata$eaten, fdata$caught))




