library(rorutadis)


### Name: removeMinimalClassCardinalities
### Title: Remove minimal class cardinality restrictions
### Aliases: removeMinimalClassCardinalities

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# set minimal class cardinalities:
# at least one alternative has to be assigned to class 2
# and at least one alternative has to be assigned to class 3
problem <- addMinimalClassCardinalities(problem, c(2, 1), c(3, 1))
# remove defined restriction for class 2
problem <- removeMinimalClassCardinalities(problem, 2)



