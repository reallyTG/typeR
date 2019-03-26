library(FLSSS)


### Name: mFLSSSpar
### Title: Multithreaded multidimensional Subset Sum given error thresholds
### Aliases: mFLSSSpar

### ** Examples

rm(list = ls()); gc()
subsetSize = 7L
supersetSize = 60L
dimension = 5L # dimensionality


# Create a supertset at random:
N = supersetSize * dimension
superset = matrix(1000 * (rnorm(N) ^ 3 + 2 * runif(N) ^ 2 +
  3 * rgamma(N, 5, 1) + 4), ncol = dimension)
rm(N)


# Plant a subset sum:
solution = sample(1L : supersetSize, subsetSize)
subsetSum = colSums(superset[solution, ])
subsetSumError = abs(subsetSum) * 0.01 # relative error within 1%
rm(solution)


# Mine subsets, dimensions fully bounded
rst = FLSSS::mFLSSSpar(maxCore = 2, len = subsetSize, mV = superset,
                       mTarget = subsetSum, mME = subsetSumError,
                       solutionNeed = 2, dl = ncol(superset), du = ncol(superset),
                       tlimit = 2, useBiSrchInFB = FALSE, avgThreadLoad = 8L)


# Verify:
cat("Number of solutions = ", length(rst), "\n")
if(length(rst) > 0)
{
  cat("Solutions unique: ")
  cat(length(unique(lapply(rst, function(x) sort(x)))) == length(rst), "\n")
  cat("Solutions correct: ")
  cat(all(unlist(lapply(rst, function(x)
    abs(colSums(superset[x, ]) - subsetSum) <= subsetSumError))), "\n")
} else
{
  cat("No solutions exist or timer ended too soon.\n")
}




# Mine subsets, the first 3 dimensions lower bounded,
# the last 4 dimension upper bounded
rst = FLSSS::mFLSSSpar(maxCore = 2, len = subsetSize, mV = superset,
                       mTarget = subsetSum, mME = subsetSumError,
                       solutionNeed = 2, dl = 3L, du = 4L,
                       tlimit = 2, useBiSrchInFB = FALSE, avgThreadLoad = 8L)


# Verify:
cat("Number of solutions = ", length(rst), "\n")
if(length(rst) > 0)
{
  cat("Solutions unique: ")
  cat(length(unique(lapply(rst, function(x) sort(x)))) == length(rst), "\n")
  cat("Solutions correct: ")
  cat(all(unlist(lapply(rst, function(x)
  {
    lowerBoundedDim = 1L : 3L
    lowerBounded = all(colSums(superset[x, lowerBoundedDim]) >=
      subsetSum[lowerBoundedDim] - subsetSumError[lowerBoundedDim])


    upperBoundedDim = (ncol(superset) - 3L) : ncol(superset)
    upperBounded = all(colSums(superset[x, upperBoundedDim]) <=
      subsetSum[upperBoundedDim] + subsetSumError[upperBoundedDim])


    lowerBounded & upperBounded
  }))), "\n")
} else
{
  cat("No solutions exist or timer ended too soon.\n")
}



