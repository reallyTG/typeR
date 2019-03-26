library(FLSSS)


### Name: mFLSSSparIntegerized
### Title: An advanced version of 'mFLSSSpar()'
### Aliases: mFLSSSparIntegerized

### ** Examples

if(.Machine$sizeof.pointer == 8L){
# =====================================================================================
# 64-bit architecture required.
# =====================================================================================
rm(list = ls()); gc()
subsetSize = 7L
supersetSize = 60L
dimension = 5L # dimensionality


# Create a supertset at random:
N = supersetSize * dimension
superset = matrix(1000 * (rnorm(N) ^ 3 + 2 * runif(N) ^ 2 + 3 * rgamma(N, 5, 1) + 4),
                  ncol = dimension)
rm(N)


# Plant a subset sum:
solution = sample(1L : supersetSize, subsetSize)
subsetSum = colSums(superset[solution, ])
subsetSumError = abs(subsetSum) * 0.01 # relative error within 1%
rm(solution)


# Mine subsets, dimensions fully bounded
system.time({rst = FLSSS::mFLSSSparIntegerized(
  maxCore = 2, len = subsetSize, mV = superset, mTarget = subsetSum,
  mME = subsetSumError, solutionNeed = 2, dl = ncol(superset),
  du = ncol(superset), tlimit = 2, useBiSrchInFB = FALSE, avgThreadLoad = 8L)})


# Compare the time cost of 'mFLSSSparIntegerized()' and 'mFLSSSpar()'. The
# speed advantage of 'mFLSSSparIntegerized()' may not be pronounced for toy
# examples.
system.time(FLSSS::mFLSSSpar(
  maxCore = 2, len = subsetSize, mV = superset, mTarget = subsetSum,
  mME = subsetSumError, solutionNeed = 2, dl = ncol(superset),
  du = ncol(superset), tlimit = 2, useBiSrchInFB = FALSE, avgThreadLoad = 8L))


# Verify:
cat("Number of solutions = ", length(rst$solution), "\n")
if(length(rst$solution) > 0)
{
  cat("Solutions unique: ")
  cat(length(unique(lapply(rst$solution, function(x)
    sort(x)))) == length(rst$solution), "\n")


  cat("Solutions correct regarding integerized data: ")
  cat(all(unlist(lapply(rst$solution, function(x)
    abs(colSums(rst$INT$mV[x, ]) - rst$INT$mTarget) <= rst$INT$mME))), "\n")


  cat("Solutions correct regarding original data: ")
  boolean = all(unlist(lapply(rst$solution, function(x)
    abs(colSums(superset[x, ]) - subsetSum) <= subsetSumError)))
  cat(boolean, "\n")
  if(!boolean)
  {
    cat("The given error threshold relative to subset sum:\n")
    givenRelaErr = round(abs(subsetSumError / subsetSum), 5)
    cat(givenRelaErr, "\n")


    cat("Solution subset sum relative error:\n")
    tmp = lapply(rst$solution, function(x)
    {
      err = round(abs(colSums(superset[x, ]) / subsetSum -1), 5)
      for(i in 1L : length(err))
      {
        if(givenRelaErr[i] < err[i]) message(paste0(err[i], " "), appendLF = FALSE)
        else cat(err[i], "")
      }
      cat("\n")
    })
    cat("Integerization caused the errors. Future versions of")
    cat("'mFLSSSparIntegerized()' would have a parameter of precision level.\n")
  }
} else
{
  cat("No solutions exist or time ended too soon.\n")
}


# Mine subsets, the first 3 dimensions lower bounded,
# the last 4 dimension upper bounded
rst = FLSSS::mFLSSSparIntegerized(
  maxCore = 2, len = subsetSize, mV = superset, mTarget = subsetSum,
  mME = subsetSumError, solutionNeed = 2, dl = 3L, du = 4L, tlimit = 2,
  useBiSrchInFB = FALSE, avgThreadLoad = 8L)


# Verify:
cat("Number of solutions = ", length(rst$solution), "\n")
if(length(rst$solution) > 0)
{
  cat("Solutions unique: ")
  cat(length(unique(lapply(rst$solution, function(x)
    sort(x)))) == length(rst$solution), "\n")


  cat("Solutions correct regarding integerized data: ")
  cat(all(unlist(lapply(rst$solution, function(x)
  {
    lowerBoundedDim = 1L : 3L
    lowerBounded = all(colSums(rst$INT$mV[x, lowerBoundedDim]) >=
      rst$INT$mTarget[lowerBoundedDim] - rst$INT$mME[lowerBoundedDim])


    upperBoundedDim = (ncol(rst$INT$mV) - 3L) : ncol(rst$INT$mV)
    upperBounded = all(colSums(rst$INT$mV[x, upperBoundedDim]) <=
      rst$INT$mTarget[upperBoundedDim] + rst$INT$mME[upperBoundedDim])


    lowerBounded & upperBounded
  }))), "\n")
} else
{
  cat("No solutions exist or timer ended too soon.\n")
}
# =====================================================================================
# =====================================================================================
}



