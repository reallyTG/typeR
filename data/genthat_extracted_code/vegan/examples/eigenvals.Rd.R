library(vegan)


### Name: eigenvals
### Title: Extract Eigenvalues from an Ordination Object
### Aliases: eigenvals eigenvals.default eigenvals.prcomp
###   eigenvals.princomp eigenvals.cca eigenvals.wcmdscale eigenvals.pcnm
###   eigenvals.dudi eigenvals.pca eigenvals.pco summary.eigenvals
### Keywords: multivariate

### ** Examples

data(varespec)
data(varechem)
mod <- cca(varespec ~ Al + P + K, varechem)
ev <- eigenvals(mod)
ev
summary(ev)

## choose which eignevalues to return
eigenvals(mod, model = "unconstrained")



