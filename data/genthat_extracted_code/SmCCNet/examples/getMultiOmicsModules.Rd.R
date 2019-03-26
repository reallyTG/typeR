library(SmCCNet)


### Name: getMultiOmicsModules
### Title: Extract multi-omics modules based on the similarity matrix.
### Aliases: getMultiOmicsModules

### ** Examples

set.seed(123)
w <- rnorm(5)
w <- w/sqrt(sum(w^2))
abar <- getAbar(w, P1 = 2, FeatureLabel = NULL)
modules <- getMultiOmicsModules(abar, P1 = 2, CutHeight = 0.5)




