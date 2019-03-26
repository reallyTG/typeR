library(cocorresp)


### Name: crossval
### Title: Cross-validation for predictive Co-Correspondence Analysis
###   models
### Aliases: crossval print.crossval summary.crossval
###   print.summary.crossval
### Keywords: multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## load the data sets
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)
## should retain only the useful PLS components for a
## parsimonious model

## Leave-one-out crossvalidation - this takes a while
## Not run: 
##D crossval(beetles, plants)
## End(Not run)
## so 2 axes are sufficient
## Don't show: 
options(od)
## End(Don't show)



