library(FLSSS)


### Name: mFLSSSparImposeBounds
### Title: Multithreaded multidimensional Subset Sum in bounded solution
###   space given error thresholds
### Aliases: mFLSSSparImposeBounds

### ** Examples

rm(list = ls()); gc()
subsetSize = 7L
supersetSize = 60L
dimension = 5L # dimensionality

## No test: 
# Create a supertset at random:
N = supersetSize * dimension
superset = matrix(1000 * (rnorm(N) ^ 3 + 2 * runif(N) ^ 2 +
                  3 * rgamma(N, 5, 1) + 4), ncol = dimension)
rm(N)


# Make up the lower and upper bounds for the solution space:
tmp = sort(sample(1L : supersetSize, subsetSize))
tmp2 = sort(sample(1L : supersetSize, subsetSize))
lowerBounds = pmin(tmp, tmp2)
upperBounds = pmax(tmp, tmp2)
rm(tmp, tmp2)


# Exclude elements not covered by 'lowerBounds' and 'upperBounds':
remainIndex = unique(unlist(apply(cbind(lowerBounds, upperBounds), 1,
                                  function(x) x[1] : x[2])))
lowerBounds = match(lowerBounds, remainIndex)
upperBounds = match(upperBounds, remainIndex)
superset = superset[remainIndex, ]


# Plant a subset sum:
solution = apply(rbind(lowerBounds, upperBounds), 2, function(x)
  sample(x[1] : x[2], 1))
subsetSum = colSums(superset[solution, ])
subsetSumError = abs(subsetSum) * 0.01 # relative error within 1%
rm(solution)


rst = FLSSS::mFLSSSparImposeBounds(
  maxCore = 2L, len = subsetSize, mV = superset, mTarget = subsetSum,
  mME = subsetSumError, LB = lowerBounds, UB = upperBounds,
  solutionNeed = 1, tlimit = 2, dl = ncol(superset), du = ncol(superset),
  targetsOrder = NULL, useBiSrchInFB = FALSE, avgThreadLoad = 8L)


# Verify:
cat("Number of solutions = ", length(rst), "\n")
if(length(rst) > 0)
{
  cat("Solutions unique: ")
  cat(length(unique(lapply(rst, function(x) sort(x)))) == length(rst), "\n")
  cat("Solution in bounded space: ")
  cat(all(unlist(lapply(rst, function(x)
    sort(x) <= upperBounds & sort(x) >= lowerBounds))), "\n")
  cat("Solutions correct: ")
  cat(all(unlist(lapply(rst, function(x)
    abs(colSums(superset[x, ]) - subsetSum) <= subsetSumError))), "\n")
} else
{
  cat("No solutions exist or timer ended too soon.\n")
}
## End(No test)



