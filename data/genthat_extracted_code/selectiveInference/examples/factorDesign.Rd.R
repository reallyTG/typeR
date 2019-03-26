library(selectiveInference)


### Name: factorDesign
### Title: Expand a data frame with factors to form a design matrix with
###   the full binary encoding of each factor.
### Aliases: factorDesign

### ** Examples

## Not run: 
##D fd = factorDesign(warpbreaks)
##D y = rnorm(nrow(fd$x))
##D fit = groupfs(fd$x, y, fd$index, maxsteps=2, intercept=FALSE)
##D pvals = groupfsInf(fit)
## End(Not run)



