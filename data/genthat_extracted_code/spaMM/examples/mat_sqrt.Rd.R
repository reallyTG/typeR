library(spaMM)


### Name: mat_sqrt
### Title: Computation of "square root" of symmetric positive definite
###   matrix
### Aliases: mat_sqrt

### ** Examples

## Not run: 
##D ## try.chol argument passed to mat_sqrt 
##D ## through the '...' argument of higher-level functions
##D ## such as HLCor, corrHLfit, fixedLRT:
##D data("scotlip")
##D HLCor(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
##D       ranPars=list(rho=0.174),adjMatrix=Nmatrix,family=poisson(),
##D       data=scotlip,try.chol=FALSE)
## End(Not run)




