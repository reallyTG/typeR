library(mco)


### Name: generationalDistance
### Title: Quality measures for MCO solutions
### Aliases: generationalDistance generalizedSpread dominatedHypervolume
###   epsilonIndicator

### ** Examples

## Estimate true front:
## Not run: 
##D tf <- nsga2(fonseca2, 2, 2,
##D             lower.bounds=c(-4, -4), upper.bounds=c(4, 4),
##D             popsize=1000, generations=100)
##D res <- nsga2(fonseca2, 2, 2,
##D              lower.bounds=c(-4, -4), upper.bounds=c(4, 4),
##D              popsize=16, generations=c(2, 4, 6, 8, 10, 20, 50))
##D n <- length(res)
##D sapply(1:n, function(i) dominatedHypervolume(res[[i]], c(1, 1)))
##D sapply(1:n, function(i) generationalDistance(res[[i]], tf))
##D sapply(1:n, function(i) generalizedSpread(res[[i]], tf))
##D sapply(1:n, function(i) epsilonIndicator(res[[i]], tf))
## End(Not run)



