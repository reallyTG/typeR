library(mirt)


### Name: boot.mirt
### Title: Calculate bootstrapped standard errors for estimated models
### Aliases: boot.mirt
### Keywords: bootstrapped errors standard

### ** Examples


## Not run: 
##D 
##D #standard
##D mod <- mirt(Science, 1)
##D booted <- boot.mirt(mod, R=20)
##D plot(booted)
##D booted
##D 
##D #run in parallel using snow back-end using all available cores
##D mod <- mirt(Science, 1)
##D booted <- boot.mirt(mod, parallel = 'snow', ncpus = parallel::detectCores())
##D booted
##D 
##D 
## End(Not run)



