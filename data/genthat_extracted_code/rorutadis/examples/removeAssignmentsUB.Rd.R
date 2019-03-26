library(rorutadis)


### Name: removeAssignmentsUB
### Title: Remove upper bound of alternative possible assignments
### Aliases: removeAssignmentsUB

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# add assignment examples: alternative 1 at least to class 2
# alternative 2 at least to class 3
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

# and remove the assignments
problem <- removeAssignmentsLB(problem, c(1, 2), 2)



