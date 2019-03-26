library(rorutadis)


### Name: investigateUtility
### Title: Post factum analysis: check how much utility is missing
### Aliases: investigateUtility

### ** Examples

perf <- matrix(c(8, 2, 1, 7, 0.5, 0.9, 0.4, 0.5), ncol = 2)
problem <- buildProblem(perf, 3, FALSE, c('g', 'g'), c(0, 0))
problem <- addAssignmentsUB(problem, c(1, 2), c(2, 3))

result <- investigateUtility(4, 3, FALSE, problem)



