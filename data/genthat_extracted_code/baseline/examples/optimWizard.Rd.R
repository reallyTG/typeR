library(baseline)


### Name: optimWizard
### Title: Visual tool for setting up optimization
### Aliases: optimWizard getOptim getOptimRes
### Keywords: baseline spectra

### ** Examples

## Not run: 
##D # Computationally intensive
##D data(milk)
##D X <- milk$spectra[,-1]
##D y <- milk$spectra[,1]
##D optimWizard(X,y)
##D 
##D # After optimisation is complete
##D plotOptim(myResults)
## End(Not run)



