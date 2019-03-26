library(mvdalab)


### Name: plusminusFit
### Title: Plus-Minus (Mas-o-Menos) Classifier
### Aliases: plusminusFit summary.plusminus summary.plusminus.default

### ** Examples

###  PLUS-Minus CLASSIFIER WITH validation = 'none', i.e. no CV ###
data(plusMinusDat)
mod1 <- plusminusFit(Y ~., data = plusMinusDat, validation = "none", n_cores = 2)
summary(mod1)

###  Plus-Minus CLASSIFIER WITH validation = 'loo', i.e. leave-one-out CV ###
## Not run: 
##D data(plusMinusDat)
##D mod2 <- plusminusFit(Y ~., data = plusMinusDat, validation = "loo", n_cores = 2)
##D summary(mod2)
## End(Not run)



