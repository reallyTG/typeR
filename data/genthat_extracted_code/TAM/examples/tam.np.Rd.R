library(TAM)


### Name: tam.np
### Title: Unidimensional Nonparametric Item Response Model
### Aliases: tam.np

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nonparametric estimation polytomous data
##D #############################################################################
##D 
##D data(data.cqc02, package="TAM")
##D dat <- data.cqc02
##D 
##D #** nonparametric estimation
##D mod <- TAM::tam.np( dat )
##D 
##D #** extractor functions for objects of class 'tam.np'
##D lmod <- IRT.likelihood(mod)
##D pmod <- IRT.posterior(mod)
##D rmod <- IRT.irfprob(mod)
##D emod <- IRT.expectedCounts(mod)
## End(Not run)



