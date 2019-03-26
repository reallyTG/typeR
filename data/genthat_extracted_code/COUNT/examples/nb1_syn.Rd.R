library(COUNT)


### Name: nb1_syn
### Title: Negative binomial (NB1): generic synthetic linear negative
###   binomial data and model
### Aliases: nb1_syn
### Keywords: models negative binomial

### ** Examples


sim.data <- nb1_syn(nobs = 5000, delta = .5, xv = c(.5, 1.25, -1.5))
mynb1 <- ml.nb1(nb1y ~ . , data = sim.data)
mynb1

## Not run: 
##D # use gamlss to model NB1 data
##D library(gamlss)         
##D sim.data <- nb1_syn(nobs = 5000, delta = .5, xv = c(.5, 1.25, -1.5))
##D mynb1 <- gamlss( nb1y ~ . , family=NBII, data = sim.data)
##D mynb1
## End(Not run)

## Not run: 
##D # default
##D sim.data <- nb1_syn()
##D dnb1 <- ml.nb1(nb1y ~ . , data = sim.data)
##D dnb1
## End(Not run)




