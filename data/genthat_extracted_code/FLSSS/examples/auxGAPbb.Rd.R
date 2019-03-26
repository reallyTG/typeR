library(FLSSS)


### Name: auxGAPbb
### Title: Multithreaded generalized assignment problem solver via branch
###   and bound
### Aliases: auxGAPbb

### ** Examples

# =============================================================================
# Data source: http://people.brunel.ac.uk/~mastjjb/jeb/orlib/gapinfo.html,
# gap1 c515-1, 5 agents 15 tasks. Parsed instances from the library can be
# found here: https://github.com/WhateverLiu/gapInstances
# =============================================================================
profit = c(17,21,22,18,24,15,20,18,19,18,16,22,24,24,16,23,16,21,16,17,16,19,
           25,18,21,17,15,25,17,24,16,20,16,25,24,16,17,19,19,18,20,16,17,21,
           24,19,19,22,22,20,16,19,17,21,19,25,23,25,25,25,18,19,15,15,21,25,
           16,16,23,15,22,17,19,22,24)
profit = t(matrix(profit, ncol = 5))
cost = c(8,15,14,23,8,16,8,25,9,17,25,15,10,8,24,15,7,23,22,11,11,12,10,17,16,
         7,16,10,18,22,21,20,6,22,24,10,24,9,21,14,11,14,11,19,16,20,11,8,14,
         9,5,6,19,19,7,6,6,13,9,18,8,13,13,13,10,20,25,16,16,17,10,10,5,12,23)
cost = t(matrix(cost, ncol = 5))
budget = c(36, 34, 38, 27, 33)


sol = FLSSS::auxGAPbb(cost, profit, budget, maxCore = 2, tlimit = 4,
                       ub = "MT", greedyBranching = TRUE, optim = "max")




# =============================================================================
# Data source: http://support.sas.com/documentation/cdl/en/ormpug/65554/HTML
# /default/viewer.htm#ormpug_decomp_examples02.htm, an example made by SAS
# corporation. 24 tasks assigned to 8 agents.
# =============================================================================
cost = t(matrix(c(
  8,18,22,5,11,11,22,11,17,22,11,20,13,13,7,22,15,22,24,8,8,24,18,8,24,14,11,
  15,24,8,10,15,19,25,6,13,10,25,19,24,13,12,5,18,10,24,8,5,22,22,21,22,13,
  16,21,5,25,13,12,9,24,6,22,24,11,21,11,14,12,10,20,6,13,8,19,12,19,18,10,21,
  5,9,11,9,22,8,12,13,9,25,19,24,22,6,19,14,25,16,13,5,11,8,7,8,25,20,24,20,11,
  6,10,10,6,22,10,10,13,21,5,19,19,19,5,11,22,24,18,11,6,13,24,24,22,6,22,5,14,
  6,16,11,6,8,18,10,24,10,9,10,6,15,7,13,20,8,7,9,24,9,21,9,11,19,10,5,23,20,5,
  21,6,9,9,5,12,10,16,15,19,18,20,18,16,21,11,12,22,16,21,25,7,14,16,10),
  ncol = 8))
profit = t(matrix(c(
  25,23,20,16,19,22,20,16,15,22,15,21,20,23,20,22,19,25,25,24,21,17,23,17,16,
  19,22,22,19,23,17,24,15,24,18,19,20,24,25,25,19,24,18,21,16,25,15,20,20,18,
  23,23,23,17,19,16,24,24,17,23,19,22,23,25,23,18,19,24,20,17,23,23,16,16,15,23,
  15,15,25,22,17,20,19,16,17,17,20,17,17,18,16,18,15,25,22,17,17,23,21,20,24,22,
  25,17,22,20,16,22,21,23,24,15,22,25,18,19,19,17,22,23,24,21,23,17,21,19,19,17,
  18,24,15,15,17,18,15,24,19,21,23,24,17,20,16,21,18,21,22,23,22,15,18,15,21,22,
  15,23,21,25,25,23,20,16,25,17,15,15,18,16,19,24,18,17,21,18,24,25,18,23,21,15,
  24,23,18,18,23,23,16,20,20,19,25,21), ncol = 8))
budget = c(36, 35, 38, 34, 32, 34, 31, 34)


# Intel CPU i7-4770 3.4GHz, g++ '-Ofast', 64-bit Windows 7:
system.time({sol = FLSSS::auxGAPbb(
  cost, profit, budget, maxCore = 2, tlimit = 4, ub = "MT",
  greedyBranching = FALSE, optim = "max")})
# user  system elapsed
# 0.02    0.00    0.01
# The elapsed time is about 1% of that reported by the SAS proc with 8
# threads, although its hardware configuration is unknown.


system.time({sol2 = FLSSS::auxGAPbb(
  cost, profit, budget, maxCore = 2, tlimit = 4, ub = "MT",
  greedyBranching = TRUE, optim = "max")})
sol[c("nodes", "bkpSolved")]  # 4526, 14671, can be different.
sol2[c("nodes", "bkpSolved")] # 4517, 13115, can be different.
# Greedy branching may lower the numbers of branching nodes and
# knapsack problems to solve.



## No test: 
# =============================================================================
# Play random numbers.
# =============================================================================
set.seed(22) # A nontrivial instance searched via changing random seeds.
             # RNG in R 3.5.1 for Windows.
Nagent = 20L; Ntask = 200L
cost = matrix(runif(Nagent * Ntask, 1e3, 1e6), nrow = Nagent)
profit = matrix(abs(rnorm(Nagent * Ntask, 1e6, 1e6)) + 1000, nrow = Nagent)
budget = apply(cost, 1, function(x) runif(1, min(x), sum(x) / 2))


# Intel CPU i7-4770 3.4GHz, g++ '-Ofast', 64-bit Windows 7.
system.time({sol1 = FLSSS::auxGAPbb(
  cost, profit, budget,
  maxCore = 1, multhreadOn = "KPs",
  tlimit = 3600, ub = "MT", greedyBranching = TRUE, optim = "max")})
# user  system elapsed
# 9.17    0.00    9.19


# Multithread knapsack problems at each branching node.
# This does not accelerate the speed at all because threading overheads
# are overwhelming.
system.time({sol2 = FLSSS::auxGAPbb(
  cost, profit, budget,
  maxCore = 7, multhreadOn = "KPs",
  tlimit = 3600, ub = "MT", greedyBranching = TRUE, optim = "max")})
# user   system elapsed
# 39.02    5.24   11.12


# Multithread nodes.
system.time({sol3 = FLSSS::auxGAPbb(
  cost, profit, budget,
  maxCore = 7, multhreadOn = "nodes", threadLoad = 32L,
  tlimit = 3600, ub = "MT", greedyBranching = TRUE, optim = "max")})
#  user  system elapsed
# 14.62    0.00    2.13
## End(No test)



