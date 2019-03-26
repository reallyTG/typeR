library(spiders)


### Name: predPref
### Title: parameter estimation
### Aliases: predPref

### ** Examples

# set parameters
Predators <- Traps <- 100
PreySpecies <- 2
Times <- 5
g <- matrix(sqrt(2), nrow=Times, ncol=PreySpecies)     # gamma
l <- matrix(seq(0.4,1.8,length.out=5)*sqrt(2), nrow=Times, ncol=PreySpecies) # ct

# fit model
## Not run: 
##D fdata <- simPref(PreySpecies, Times, Predators, Traps, l, g, EM=FALSE)
##D predPref(fdata$eaten, fdata$caught, hypotheses=c('ct', 'cst'))
## End(Not run)



