library(FLSSS)


### Name: auxGAPga
### Title: Multithreaded generalized assignment problem solver via genetic
###   algorithm
### Aliases: auxGAPga

### ** Examples

# =============================================================================
# A trivial instance
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


Nagent = 5L; Ntask = 15L
rst = FLSSS::auxGAPga(
  cost, profit, budget, trials = 2, populationSize = 100, generations = 10000,
  randomSeed = 42, maxCore = 2, optim = "max")


# =============================================================================
# A relatively hard instance.
# =============================================================================
# Download gapInstances.Rdata from
# https://github.com/WhateverLiu/gapInstances. Load it in R.
## No test: 
cost = gapC[[3]]$cost
loss = gapC[[3]]$loss
budget = gapC[[3]]$budget
# Intel CPU i7-4770 3.4GHz, g++ '-Ofast', 64-bit Windows 7.
system.time({rst = FLSSS::auxGAPga(cost, loss, budget, trials = 7,
             randomSeed = 42, populationSize = 100, generations = 500000,
             optim = "min", maxCore = 7)})
rst$totalProfitOrLoss # 1416
#  user  system elapsed
# 69.24    0.17   11.61
# The known optimum equals 1402 as the total loss.
## End(No test)



