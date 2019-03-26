library(rorutadis)


### Name: addAssignmentPairwiseAtMostComparisons
### Title: Add assignment pairwise _at most_ comparisons
### Aliases: addAssignmentPairwiseAtMostComparisons

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# add comparison:
# alternative 4 to class at most better by 1 class then class
# of alternative 3
problem <- addAssignmentPairwiseAtMostComparisons(problem, c(4, 3, 1))



