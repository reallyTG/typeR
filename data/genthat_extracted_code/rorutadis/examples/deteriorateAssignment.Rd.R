library(rorutadis)


### Name: deteriorateAssignment
### Title: Post factum analysis: deteriorate assignment
### Aliases: deteriorateAssignment

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.5), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

rho <- deteriorateAssignment(4, 1, c(TRUE, TRUE), FALSE, problem)



