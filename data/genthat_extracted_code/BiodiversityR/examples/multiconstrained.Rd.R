library(BiodiversityR)


### Name: multiconstrained
### Title: Pairwise Comparisons for All Levels of a Categorical Variable by
###   RDA, CCA or Capscale
### Aliases: multiconstrained
### Keywords: multivariate

### ** Examples

## Not run: 
##D library(vegan)
##D library(MASS)
##D data(dune)
##D data(dune.env)
##D multiconstrained(method="capscale", dune~Management, data=dune.env,
##D     distance="bray",add=TRUE)
##D multiconstrained(method="capscale", dune~Management, data=dune.env, 
##D     distance="bray", add=TRUE, contrast=3)
## End(Not run)



