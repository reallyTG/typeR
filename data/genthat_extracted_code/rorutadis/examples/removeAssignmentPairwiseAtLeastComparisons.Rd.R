library(rorutadis)


### Name: removeAssignmentPairwiseAtLeastComparisons
### Title: Remove assignment pairwise _at least_ comparisons
### Aliases: removeAssignmentPairwiseAtLeastComparisons

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# add comparisons:
# alternative 2 to class at least as good as class of alternative 1
# alternative 4 to class at least better by 1 class then class
# of alternative 3
problem <- addAssignmentPairwiseAtLeastComparisons(problem,
   c(4, 3, 1), c(2, 1, 0))
# remove comparison between alternative 4 and 3
problem <- removeAssignmentPairwiseAtLeastComparisons(problem, c(4, 3))



