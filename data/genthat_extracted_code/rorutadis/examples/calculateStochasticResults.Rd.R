library(rorutadis)


### Name: calculateStochasticResults
### Title: Stochastic results
### Aliases: calculateStochasticResults

### ** Examples

perf <- matrix(c(2,1,1,2), 2)
problem <- buildProblem(perf, 2, FALSE, c('g', 'g'), c(0, 0))

calculateStochasticResults(problem, 1000)



