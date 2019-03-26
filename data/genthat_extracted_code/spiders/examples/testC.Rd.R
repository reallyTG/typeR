library(spiders)


### Name: testC
### Title: linear contrast of c_st
### Aliases: testC

### ** Examples

# set parameters
Predators <- Traps <- 100
PreySpecies <- 2
Times <- 5
g <- matrix(sqrt(2), nrow=Times, ncol=PreySpecies)     # gamma
l <- matrix(seq(0.4,1.8,length.out=5)*sqrt(2), nrow=Times, ncol=PreySpecies) # ct

# fit model and contrast
## Not run: 
##D set.seed(0)
##D fdata <- simPref(PreySpecies, Times, Predators, Traps, l, g, EM=FALSE) # p-value=0.305
##D pref <- predPref(fdata$eaten, fdata$caught, hypotheses=c('ct', 'cst'))
##D testC(pref, b = c(0,1, -1, 0, 0)) # p-value > sig.level => ct is used, not cst
## End(Not run)



