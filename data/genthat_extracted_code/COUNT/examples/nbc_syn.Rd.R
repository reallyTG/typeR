library(COUNT)


### Name: nbc_syn
### Title: Negative binomial (NB-C): generic synthetic canonical negative
###   binomial data and model
### Aliases: nbc_syn
### Keywords: models negative binomial

### ** Examples


## Not run: 
##D sim.data <- nbc_syn(nobs = 50000, alpha = 1.15, xv = c(-1.5, -1.25, -.1))
##D mynbc <- ml.nbc(nbcy ~ . , data = sim.data)
##D mynbc
##D 
##D # default
##D sim.data <- nbc_syn()
##D dnbc <- ml.nbc(nbcy ~ . , data = sim.data)
##D dnbc
## End(Not run)



