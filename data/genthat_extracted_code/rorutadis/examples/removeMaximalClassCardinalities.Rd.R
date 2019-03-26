library(rorutadis)


### Name: removeMaximalClassCardinalities
### Title: Remove maximal class cardinality restrictions
### Aliases: removeMaximalClassCardinalities

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# set maximal class cardinalities:
# at most two alternatives could be assigned to class 2
# and at most one alternative could be assigned to class 3
problem <- addMaximalClassCardinalities(problem, c(2, 2), c(3, 1))
# remove defined restriction for class 2
problem <- removeMaximalClassCardinalities(problem, 2)



