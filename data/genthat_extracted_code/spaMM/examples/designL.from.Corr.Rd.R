library(spaMM)


### Name: designL.from.Corr
### Title: Computation of "square root" of correlation matrix
### Aliases: designL.from.Corr

### ** Examples

## Not run: 
##D ## try.chol argument passed to designL.from.Corr 
##D ## through the '...' argument of higher-level functions
##D ## such as HLCor, corrHLfit, fixedLRT:
##D data("scotlip")
##D opt <- spaMM.options(mat_sqrt_fr="designL.from.Corr")
##D HLCor(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
##D       ranPars=list(rho=0.174),adjMatrix=Nmatrix,family=poisson(),
##D       data=scotlip,try.chol=FALSE)
##D spaMM.options(opt)
## End(Not run)




