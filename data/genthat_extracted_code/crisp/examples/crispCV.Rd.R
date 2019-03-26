library(crisp)


### Name: crispCV
### Title: CRISP with Tuning Parameter Selection via Cross-Validation.
### Aliases: crispCV

### ** Examples

## Not run: 
##D #See ?'crisp-package' for a full example of how to use this package
##D 
##D #generate data (using a very small 'n' for illustration purposes)
##D set.seed(1)
##D data <- sim.data(n = 15, scenario = 2)
##D 
##D #fit model and select lambda using 2-fold cross-validation
##D #note: use larger 'n.fold' (e.g., 10) in practice
##D crispCV.out <- crispCV(X = data$X, y = data$y, n.fold = 2)
## End(Not run)



