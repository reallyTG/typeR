library(nsga2R)


### Name: fastNonDominatedSorting
### Title: Fast Non-dominated Sorting
### Aliases: fastNonDominatedSorting

### ** Examples

set.seed(1234)
# randomly generate a polulation of fifty chromosomes, each with two objectives
y <- matrix(runif(100, -5, 5), nrow=50, ncol=2)
rankIdxList <- fastNonDominatedSorting(y)
rankIdxList



