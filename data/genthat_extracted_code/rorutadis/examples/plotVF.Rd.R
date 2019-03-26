library(rorutadis)


### Name: plotVF
### Title: Plot value function
### Aliases: plotVF

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('c', 'g'), c(3, 3))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

representativeFunction <- findRepresentativeFunction(problem, 0)
plotVF(representativeFunction)



