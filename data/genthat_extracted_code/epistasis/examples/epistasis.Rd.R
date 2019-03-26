library(epistasis)


### Name: epistasis
### Title: Detecting epistatic selection from multi-loci genotype data
### Aliases: epistasis

### ** Examples

## Not run: 
##D #simulate data
##D D <- episim(p=50, n=100, k= 3, adjacent = 3, alpha = 0.06 , beta = 0.06)
##D plot(D)
##D 
##D #epistasis path estimation using approx
##D out1 <-  epistasis(D$data, method="approx", n.rho= 5)
##D plot(out1)
##D 
##D #epistasis path estimation using gibbs
##D out2  <-  epistasis(D$data, method="gibbs", n.rho= 5, ncores= 1)
##D plot(out2)
## End(Not run)



