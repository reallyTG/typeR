library(riv)


### Name: riv-package
### Title: Robust instrumental variables estimator package.
### Aliases: riv-package
### Keywords: multivariate

### ** Examples

## load data earthquake: the first column is the response Y, the second
## the endogenous variable X and the third column is the instrument
## Zinst.
data(earthquake)
riv(earthquake[,1], earthquake[,2], NULL, earthquake[,3])



