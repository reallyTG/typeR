library(FLSSS)


### Name: auxKnapsack01bb
### Title: Multithreaded binary knapsack problem solver via branch and
###   bound
### Aliases: auxKnapsack01bb

### ** Examples

set.seed(42)
weight = runif(100, min = 1e3, max = 1e6)
value = weight ^ 0.5 * 100 # Higher correlation between item weights and values
                           # typically implies a harder knapsack problem.
caps = runif(10, min(weight), sum(weight))
rst = FLSSS::auxKnapsack01bb(weight, value, caps, maxCore = 2, tlimit = 2)
str(rst)



