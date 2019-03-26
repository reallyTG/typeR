library(rorutadis)


### Name: findRepresentativeFunction
### Title: Find representative utility function
### Aliases: findRepresentativeFunction

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

representativeFunction <- findRepresentativeFunction(problem, 0)
assignments <- representativeFunction$assignments



