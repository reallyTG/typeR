library(partialCI)


### Name: test.pci
### Title: Tests the goodness of fit of a partial cointegration model
### Aliases: test.pci
### Keywords: ts models

### ** Examples

# The following should reject both the random walk and AR(1) models

## Not run: 
##D # Example using the very fast "wilk" method
##D # The following should be classified as PCI, i.e., both Nullhypothesis should be rejected even
##D # if we account for multiple testing (alpha_bonf, alpha_holm)
##D set.seed(1313)
##D YX <- rpci(n=1000,beta=c(1), sigma_C=c(0.1), rho=0.8, sigma_M=1, sigma_R=1)
##D test.pci(Y=YX[,1], X=YX[,2:ncol(YX)])
##D 
##D # Example using the parametric bootstrap "boot" method with 999 iterations (inrep = 999 and 
##D # a starting seed of 1 (istart.seed= 1)
##D # The following should be classified as PCI, i.e., both Nullhypothesis should be rejected even
##D # if we account for multiple testing (alpha_bonf, alpha_holm)
##D # Results are very similar
##D set.seed(1313)
##D 
##D YX <- rpci(n=1000,beta=c(1), sigma_C=c(0.1), rho=0.8, sigma_M=1, sigma_R=1)
##D test.pci(Y=YX[,1], X=YX[,2:ncol(YX)],imethod = "boot", inrep = 999,
##D         istart.seed= 1)
##D         
##D 
## End(Not run)



