library(rorutadis)


### Name: improveAssignment
### Title: Post factum analysis: improve assignment
### Aliases: improveAssignment

### ** Examples

perf <- matrix(c(8, 2, 1, 7, 0.5, 0.9, 0.4, 0.5), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsUB(problem, c(1, 2), c(2, 3))

# a_1 dominates a_4 and a_1 is assigned at most to class C_2
# How many times evaluations of a_4 should be improved
# that a_4 will be assigned possibly to class C_3?
rho <- improveAssignment(4, 3, c(TRUE, TRUE), FALSE, problem)



