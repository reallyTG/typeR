library(FLSSS)


### Name: auxGAPbbDp
### Title: Multithreaded generalized assignment problem solver via a hybrid
###   of branch-and-bound and dynamic programming.
### Aliases: auxGAPbbDp

### ** Examples

# =============================================================================
# Data source: http://support.sas.com/documentation/cdl/en/ormpug/65554/HTML
# /default/viewer.htm#ormpug_decomp_examples02.htm, an example made by SAS
# corporation. 24 tasks assigned to 8 agents.
# =============================================================================
cost = t(matrix(as.integer(c(
  8,18,22,5,11,11,22,11,17,22,11,20,13,13,7,22,15,22,24,8,8,24,18,8,24,14,11,
  15,24,8,10,15,19,25,6,13,10,25,19,24,13,12,5,18,10,24,8,5,22,22,21,22,13,
  16,21,5,25,13,12,9,24,6,22,24,11,21,11,14,12,10,20,6,13,8,19,12,19,18,10,21,
  5,9,11,9,22,8,12,13,9,25,19,24,22,6,19,14,25,16,13,5,11,8,7,8,25,20,24,20,11,
  6,10,10,6,22,10,10,13,21,5,19,19,19,5,11,22,24,18,11,6,13,24,24,22,6,22,5,14,
  6,16,11,6,8,18,10,24,10,9,10,6,15,7,13,20,8,7,9,24,9,21,9,11,19,10,5,23,20,5,
  21,6,9,9,5,12,10,16,15,19,18,20,18,16,21,11,12,22,16,21,25,7,14,16,10)),
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
budget = as.integer(c(36, 35, 38, 34, 32, 34, 31, 34))


system.time({sol = FLSSS::auxGAPbbDp(
  cost, profit, budget,
  maxCore = 2, tlimit = 4, greedyBranching = TRUE, optim = "max")})
sol[c("nodes", "bkpSolved")] # 2630, 8102



## No test: 
set.seed(8) # A nontrivial instance searched via changing random seeds.
            # RNG in R 3.5.1 for Windows.
Nagent = 20L; Ntask = 200L
cost = matrix(as.integer(runif(Nagent * Ntask, 1, 50)), nrow = Nagent)
budget = as.integer(apply(cost, 1, function(x) runif(1, min(x), sum(x) / 2)))
profit = matrix(abs(rnorm(Nagent * Ntask, 1e6, 1e6)) + 1000, nrow = Nagent)


# Intel CPU i7-4770 3.4GHz, g++ '-Ofast', 64-bit Windows 7.
system.time({sol1 = FLSSS::auxGAPbb(
  cost, profit, budget,
  maxCore = 7, multhreadOn = "nodes",
  tlimit = 3600, greedyBranching = TRUE, optim = "max")})
# user  system elapsed
# 14.43    0.00    2.11


system.time({sol2 = FLSSS::auxGAPbbDp(
  cost, profit, budget,
  maxCore = 7, multhreadOn = "nodes",
  tlimit = 3600, greedyBranching = TRUE, optim = "max")})
# user  system elapsed
# 5.77    0.00    0.87
# Dynamic programming for solving knapsack problems could be faster
# for integral costs and budgets of small magnitudes.
## End(No test)



