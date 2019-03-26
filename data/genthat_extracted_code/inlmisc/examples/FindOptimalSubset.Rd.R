library(inlmisc)


### Name: FindOptimalSubset
### Title: Find Optimal Subset Using a GA
### Aliases: FindOptimalSubset
### Keywords: optimize

### ** Examples

# Problem: Choose the 4 smallest numbers from a list of 100 values
# genearated from a standard uniform distribution.
k <- 4
n <- 100
seed <- 123
set.seed(seed); numbers <- sort(runif(n))
Fitness <- function(string, n, numbers) {
  idxs <- DecodeChromosome(string, n)
  -sum(numbers[idxs])
}
## Not run: 
##D out <- FindOptimalSubset(n, k, Fitness, numbers, elitism = 1, run = 10,
##D                          monitor = GA::gaislMonitor, seed = seed)
##D plot(out[["ga_output"]])
##D summary(out[["ga_output"]])
##D print(out[["solution"]])
##D print(out[["ga_output"]]@fitnessValue)
## End(Not run)




