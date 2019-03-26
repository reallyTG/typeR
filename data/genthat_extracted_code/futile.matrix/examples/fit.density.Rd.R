library(futile.matrix)


### Name: fit.density
### Title: Fit the eigenvalue spectrum to model
### Aliases: fit.density

### ** Examples

## Not run: 
##D m <- rmatrix(WishartModel(50, 200))
##D es <- eigen(m)
##D fit.density(es, MaximumLikelihoodFit(hint=c(1,1)))
## End(Not run)



