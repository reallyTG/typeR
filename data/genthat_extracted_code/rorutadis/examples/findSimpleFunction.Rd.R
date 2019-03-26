library(rorutadis)


### Name: findSimpleFunction
### Title: Find one value function
### Aliases: findSimpleFunction

### ** Examples

perf <- matrix(c(5, 2, 1, 7, 0.5, 0.9, 0.4, 0.4), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsLB(problem, c(1, 2), c(2, 3))

simpleFunction <- findSimpleFunction(problem)



