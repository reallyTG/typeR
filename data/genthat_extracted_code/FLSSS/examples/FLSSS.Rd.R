library(FLSSS)


### Name: FLSSS
### Title: One-dimensional Subset Sum given error threshold
### Aliases: FLSSS

### ** Examples

# =====================================================================================
# Example I: play random numbers.
# =====================================================================================
rm(list = ls()); gc()
subsetSize = 200L
supersetSize = 1000L
superset = 10000 * sort(rnorm(supersetSize) ^ 3 + 2 * runif(supersetSize) ^ 2 +
           3 * rgamma(supersetSize, 5, 1) + 4)
subsetSum = runif(1, sum(superset[1L : subsetSize]), sum(superset[(supersetSize -
            subsetSize + 1L) : supersetSize]))
subsetSumError = 1e-3


# Mine 3 subsets
rst1 = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                    ME = subsetSumError, solutionNeed = 3, tlimit = 4)


# Mine 3 subsets via solving the conjugate problem
rst2 = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                    ME = subsetSumError, solutionNeed = 3, tlimit = 4,
                    viaConjugate = TRUE)


# Verify uniqueness
cat("rst1 number of solutions =",
    length(unique(lapply(rst1, function(x) sort(x)))), "\n")
cat("rst2 number of solutions =",
    length(unique(lapply(rst2, function(x) sort(x)))), "\n")


# Verify solutions
if(length(rst1) > 0)
  all(unlist(lapply(rst1, function(x)
    abs(sum(superset[x]) - subsetSum) <= subsetSumError)))
if(length(rst2) > 0)
  all(unlist(lapply(rst2, function(x)
    abs(sum(superset[x]) - subsetSum) <= subsetSumError)))


# Mine 3 subsets in bounded solution space.
# Make up the lower and upper bounds for the solution space:
tmp = sort(sample(1L : supersetSize, subsetSize))
tmp2 = sort(sample(1L : supersetSize, subsetSize))
lowerBounds = pmin(tmp, tmp2)
upperBounds = pmax(tmp, tmp2)
rm(tmp, tmp2)


# 'FLSSS()' does not work if there are elements not under the hood of
# lowerBounds + upperBounds. Exclude those elements:
remainIndex = unique(unlist(apply(cbind(lowerBounds, upperBounds), 1,
  function(x) x[1] : x[2])))
lowerBounds = match(lowerBounds, remainIndex)
upperBounds = match(upperBounds, remainIndex)
superset = superset[remainIndex]


# Plant a subset sum:
solution = integer(subsetSize)
solution[1] = sample(lowerBounds[1] : upperBounds[1], 1)
for(i in 2L : subsetSize)
{
  l = max(lowerBounds[i], solution[i - 1] + 1L)
  u = upperBounds[i]
  if(l == u) solution[i] = u
  else solution[i] = sample(l : u, 1)
}
subsetSum = sum(superset[solution])
subsetSumError = abs(subsetSum) * 0.01 # relative error within 1%
rm(solution)


rst3 = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                    ME = subsetSumError, solutionNeed = 2, tlimit = 4,
                    LB = lowerBounds, UB = upperBounds, viaConjugate = TRUE)


print(length(rst3))


# Verify solutions
if(length(rst3) > 0)
  cat(all(unlist(lapply(rst3, function(x)
    abs(sum(superset[x]) - subsetSum) <= subsetSumError))), "\n")




# =====================================================================================
# Example II: mine a real-world dataset.
# =====================================================================================
rm(list = ls()); gc()
superset = c(
  -1119924501, -793412295, -496234747,  -213654767,   16818148,   26267601,   26557292,
     27340260,   28343800,   32036573,    32847411,   34570996,   34574989,   43633028,
     44003100,   47724096,   51905122,    52691025,   53600924,   56874435,   58207678,
     60225777,   60639161,   60888288,    60890325,   61742932,   63780621,   63786876,
     65167464,   66224357,   67198760,    69366452,   71163068,   72338751,   72960793,
     73197629,   76148392,   77779087,    78308432,   81196763,   82741805,   85315243,
     86446883,   87820032,   89819002,    90604146,   93761290,   97920291,   98315039,
    310120088, -441403864, -548143111,  -645883459, -149110919,  305170449, -248934805,
  -1108320430, -527806318, -192539936, -1005074405, -101557770, -156782742, -285384687,
   -418917176,   80346546, -273215446,  -552291568,   86824498,  -95392618, -707778486)
superset = sort(superset)
subsetSum = 139254953
subsetSumError = 0.1


# Find a subset of size 10.
subsetSize = 10L
rst = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                   ME = subsetSumError, solutionNeed = 1, tlimit = 4)
# Verify:
all(unlist(lapply(rst, function(x)
  abs(sum(superset[x]) - subsetSum) <= subsetSumError)))


# Find a subset without size specification.
rst = FLSSS::FLSSS(len = 0, v = superset, target = subsetSum,
                   ME = subsetSumError, solutionNeed = 1, tlimit = 4)
# Verify:
all(unlist(lapply(rst, function(x)
  abs(sum(superset[x]) - subsetSum) <= subsetSumError)))


# Find a subset via looping subset size over 2L : (length(v)).
for(len in 2L : length(superset))
{
  rst = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                     ME = subsetSumError, solutionNeed = 1, tlimit = 4)
  if(length(rst) > 0) break
}
# Verify:
all(unlist(lapply(rst, function(x)
  abs(sum(superset[x]) - subsetSum) <= subsetSumError)))


# Find as many qualified susbets as possible in 2 seconds
rst = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                   ME = subsetSumError, solutionNeed = 999999L, tlimit = 2)
cat("Number of solutions =", length(rst), "\n")


# Verify:
all(unlist(lapply(rst, function(x)
  abs(sum(superset[x]) - subsetSum) <= subsetSumError)))




# =====================================================================================
# Example III: solve a special knapsack problem.
# Given the knapsack's capacity, the number of catagories, the number of items in each
# catagory, select the least number of items to fulfill at least 95% of the knapsack's
# capacity.
# =====================================================================================
rm(list = ls()); gc()
capacity = 361
catagories = LETTERS[1L : 10L] # A, B, ..., J, 10 catagories
catagoryMasses = round(runif(length(catagories)) * 20 + 1)
catagoryItems = sample(1L : 20L, length(catagories))


itemLabel = unlist(mapply(function(x, i) rep(i, x), catagoryItems, catagories))
itemMasses = unlist(mapply(function(x, i) rep(x, i), catagoryMasses, catagoryItems))
vorder = order(itemMasses)
itemLabel = itemLabel[vorder]


superset = itemMasses[vorder]
rate = 0.95
subsetSum = (capacity * rate + capacity) / 2
subsetSumError = capacity - subsetSum
for(subsetSize in 1L : length(itemMasses))
{
  rst = FLSSS::FLSSS(len = subsetSize, v = superset, target = subsetSum,
                     ME = subsetSumError, solutionNeed = 1, tlimit = 4)
  if(length(rst) > 0) break
}


# There may exist no qualified subsets. One can lower 'rate' until a solution
# shows up.
if(length(rst) == 0L)
{
  cat("No solutions. Please lower rate and rerun.\n")
} else
{
  cat("A solution:\n")
  print(table(itemLabel[rst[[1]]]))
}


rm(list = ls()); gc()



