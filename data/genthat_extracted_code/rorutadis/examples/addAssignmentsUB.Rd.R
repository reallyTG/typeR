library(rorutadis)


### Name: addAssignmentsUB
### Title: Add upper bound of alternative possible assignments
### Aliases: addAssignmentsUB

### ** Examples

# 4 alternatives, 2 gain criteria, 3 classes, monotonously increasing
# and general marginal value functions
perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))

# add assignment examples: alternative 3 at most to class as good as class 1
# and alternative 4 to class at most as good as class 2
problem <- addAssignmentsUB(problem, c(3, 1), c(4, 2))



