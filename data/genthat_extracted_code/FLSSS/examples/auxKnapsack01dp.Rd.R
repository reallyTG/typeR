library(FLSSS)


### Name: auxKnapsack01dp
### Title: Multithreaded binary knapsack problem solver via dynamic
###   programming
### Aliases: auxKnapsack01dp

### ** Examples

set.seed(42)
weight = sample(10L : 100L, 600L, replace = TRUE) # Dynamic programming
                                                  # solution requires integer
                                                  # weights.
value = weight ^ 0.5 * 100 # Higher correlation between item weights and values
                           # typically implies a harder knapsack problem.
caps = as.integer(runif(10, min(weight), 600L))
system.time({rstDp = FLSSS::auxKnapsack01dp(
  weight, value, caps, maxCore = 2, tlimit = 4)})
system.time({rstBb = FLSSS::auxKnapsack01bb(
  weight, value, caps, maxCore = 2, tlimit = 4)})
# Dynamic programming can be faster than branch-and-bound for integer weights
# and capacity of small magnitudes.



