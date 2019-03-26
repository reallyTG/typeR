library(BurStFin)


### Name: factor.model.stat
### Title: Estimate Variance Matrix via Statistical Factors
### Aliases: factor.model.stat
### Keywords: multivariate

### ** Examples

## Not run: 
##D varian1 <- factor.model.stat(retmat)
##D 
##D varfac <- factor.model.stat(retmat, nfac=0, zero=TRUE, output="fact")
##D 
##D varian2 <- fitted(varfac) # get matrix from factor model
##D 
##D varian3 <- factor.model.stat(retmat, nfac=rep(c(5,3,1), c(20,40,1)))
## End(Not run)



