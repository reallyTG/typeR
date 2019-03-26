library(VCA)


### Name: vcovFixed
### Title: Calculate Variance-Covariance Matrix and Standard Errors of
###   Fixed Effects for an 'VCA' Object.
### Aliases: vcovFixed

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit1 <- anovaMM(y~day/(run), dataEP05A2_1)
##D vcov(fit1)
##D 
##D fit2 <- anovaVCA(y~day/run, dataEP05A2_1)
##D vcov(fit2)
## End(Not run)



