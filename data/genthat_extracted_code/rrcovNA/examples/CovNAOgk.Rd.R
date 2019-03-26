library(rrcovNA)


### Name: CovNAOgk
### Title: Robust Location and Scatter Estimation - Ortogonalized
###   Gnanadesikan-Kettenring (OGK) for incomplete data
### Aliases: CovNAOgk
### Keywords: robust multivariate

### ** Examples

data(bush10)
CovNAOgk(bush10)

## the following three statements are equivalent
c1 <- CovNAOgk(bush10, niter=1)
c2 <- CovNAOgk(bush10, control = CovControlOgk(niter=1))

## direct specification overrides control one:
c3 <- CovNAOgk(bush10, beta=0.95,
             control = CovControlOgk(beta=0.99))
c1



