library(BAMMtools)


### Name: getBranchShiftPriors
### Title: Compute prior odds of a rate shift on each branch of a phylogeny
###   from BAMM output
### Aliases: getBranchShiftPriors
### Keywords: models

### ** Examples

data(whales)
prior_tree1 <- getBranchShiftPriors(whales, expectedNumberOfShifts = 1)
prior_tree10 <- getBranchShiftPriors(whales, expectedNumberOfShifts = 10)
# plot prior expectations for branches based on these two counts:
plot(prior_tree1$edge.length ~ prior_tree10$edge.length, xlim=c(0,0.05),
     ylim=c(0,0.05), asp=1)
lines(x=c(0,1), y=c(0,1))



