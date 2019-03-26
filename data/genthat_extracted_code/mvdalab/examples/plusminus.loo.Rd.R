library(mvdalab)


### Name: plusminus.loo
### Title: Leave-one-out routine for 'plusminus' objects
### Aliases: plusminus.loo

### ** Examples

data(plusMinusDat)
mod1 <- plusminusFit(Y ~., data = plusMinusDat, validation = "loo", n_cores = 2)
## Not run: 
##D summary(mod1)
##D mod1$validation$cvError
##D mod1$validation$in.bag
## End(Not run)



