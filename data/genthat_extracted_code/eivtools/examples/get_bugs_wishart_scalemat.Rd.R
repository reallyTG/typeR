library(eivtools)


### Name: get_bugs_wishart_scalemat
### Title: Compute a BUGS-compliant scale matrix for a Wishart prior
###   distribution for precision matrix that is consistent with target
###   variances.
### Aliases: get_bugs_wishart_scalemat
### Keywords: models

### ** Examples

## No test: 
tmp <- get_bugs_wishart_scalemat(target = c(10,4,4,8), nsim = 30000,
reltol = 0.02, quietly=FALSE)
print(tmp)

## if you now model precison matrix M ~ dwish(tmp$bugs.scalemat,
## tmp$bugs.df) in a BUGS language, this will imply a prior distribution
## for the inverse of M that has medians of the diagonal elements
## approximately equal to 'target'
## End(No test)



