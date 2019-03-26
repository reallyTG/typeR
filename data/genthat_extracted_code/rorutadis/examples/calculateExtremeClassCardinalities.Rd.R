library(rorutadis)


### Name: calculateExtremeClassCardinalities
### Title: Calculate extreme class cardinalities
### Aliases: calculateExtremeClassCardinalities

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

extremeClassCardinalities <- calculateExtremeClassCardinalities(problem)



