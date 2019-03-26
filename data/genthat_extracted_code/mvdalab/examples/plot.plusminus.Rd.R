library(mvdalab)


### Name: plot.plusminus
### Title: 2D Graph of the PCA scores associated with a plusminusFit
### Aliases: plot.plusminus

### ** Examples

###  PLUS-Minus CLASSIFIER WITH validation = 'none', i.e. no CV ###
data(plusMinusDat)
mod1 <- plusminusFit(Y ~., data = plusMinusDat, validation = "none", n_cores = 2)
plot(mod1, ncomp = 2, comps = c(1, 2))

###  Plus-Minus CLASSIFIER WITH validation = 'loo', i.e. leave-one-out CV ###
## Not run: 
##D data(plusMinusDat)
##D mod2 <- plusminusFit(Y ~., data = plusMinusDat, validation = "loo", n_cores = 2)
##D plot(mod2, ncomp = 2, comps = c(1, 2))
## End(Not run)



