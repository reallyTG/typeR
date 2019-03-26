library(vegan)


### Name: decostand
### Title: Standardization Methods for Community Ecology
### Aliases: decostand wisconsin
### Keywords: multivariate manip

### ** Examples

data(varespec)
sptrans <- decostand(varespec, "max")
apply(sptrans, 2, max)
sptrans <- wisconsin(varespec)

## Chi-square: PCA similar but not identical to CA.
## Use wcmdscale for weighted analysis and identical results.
sptrans <- decostand(varespec, "chi.square")
plot(procrustes(rda(sptrans), cca(varespec)))



