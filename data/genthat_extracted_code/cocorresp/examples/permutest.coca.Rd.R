library(cocorresp)


### Name: permutest.coca
### Title: Permutation test for predictive co-correspondence analysis
###   models
### Aliases: permutest.coca print.permutest.coca summary.permutest.coca
###   print.summary.permutest.coca
### Keywords: multivariate

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## load some data
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)
## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)

## should retain only the useful PLS components for a parsimonious model
## Not run: 
##D ## Leave-one-out crossvalidation - this takes a while
##D crossval(beetles, plants)
##D ## so 2 axes are sufficient
##D 
##D ## permutation test to assess significant PLS components - takes a while
##D bp.perm <- permutest(bp.pred, permutations = 99)
##D bp.perm
##D summary(bp.perm)
## End(Not run)

## permutation test, this time only testing the first 2 axes
bp.perm <- permutest(bp.pred, permutations = 75, n.axes = 2)
bp.perm

## Don't show: 
options(od)
## End(Don't show)



