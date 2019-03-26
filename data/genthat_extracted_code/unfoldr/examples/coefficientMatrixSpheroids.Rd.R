library(unfoldr)


### Name: coefficientMatrixSpheroids
### Title: Coefficients for trivariate unfolding
### Aliases: coefficientMatrixSpheroids

### ** Examples

## Not run: 
##D ## Comment: Set breaks vector and compute the coefficient matrix 
##D ## for spheroid unfolding
##D 	
##D options(par.unfoldr=2L)
##D breaks <- setbreaks(c(6,5,6),maxSize=0.37,kap=1.25)
##D breaks
##D 
##D P <- coefficientMatrixSpheroids(breaks,check=FALSE)
##D c(min(P),max(P),sum(P))
##D 
## End(Not run)



