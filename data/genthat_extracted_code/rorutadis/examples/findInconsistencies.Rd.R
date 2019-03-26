library(rorutadis)


### Name: findInconsistencies
### Title: Find inconsistencies in preference information
### Aliases: findInconsistencies

### ** Examples

perf <- matrix(c(1, 2, 2, 1), ncol = 2)
problem <- buildProblem(perf, 3, TRUE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsUB(problem, c(1, 1))
problem <- addAssignmentsLB(problem, c(2, 2))

checkConsistency(problem) # TRUE

problem <- addAssignmentsLB(problem, c(1, 3)) # added inconsistency

checkConsistency(problem) # FALSE

inconsistencies <- findInconsistencies(problem)

setsOfprefInfo <- lapply(inconsistencies,
                         function(x) { getRestrictions(problem, x) })



