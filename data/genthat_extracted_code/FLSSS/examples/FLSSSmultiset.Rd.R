library(FLSSS)


### Name: FLSSSmultiset
### Title: Multi-Subset Sum given error threshold
### Aliases: FLSSSmultiset

### ** Examples

rm(list = ls()); gc()
Nsupersets = 30L
supersetSizes = sample(5L : 20L, Nsupersets, replace = TRUE)
subsetSizes = sapply(supersetSizes, function(x) sample(1L : x, 1))


# Create supersets at random:
supersets = lapply(supersetSizes, function(n)
{
  1000 * (rnorm(n) ^ 3 + 2 * runif(n) ^ 2 + 3 * rgamma(n, 5, 1) + 4)
})
str(supersets) # see the structure


# Give a subset sum
solution = mapply(function(n, l) sample(1L : n, l), supersetSizes, subsetSizes)
str(solution) # See structure
subsetsSum = sum(mapply(function(x, s) sum(x[s]), supersets, solution, SIMPLIFY = TRUE))
subsetsSumError = abs(subsetsSum) * 1e-7 # relative error within 0.00001%
rm(solution)


# Mine subsets:
rst = FLSSS::FLSSSmultiset(len = subsetSizes, buckets = supersets, target = subsetsSum,
                           ME = subsetsSumError, solutionNeed = 3, tlimit = 4)
cat("Number of solutions =", length(rst), "\n")


# Verify:
ver = all(unlist(lapply(rst, function(sol)
{
  S = sum(unlist(mapply(function(x, y) sum(x[y]), supersets, sol)))
  abs(S - subsetsSum) <= subsetsSumError
})))
cat("All subsets are qualified:", ver)



