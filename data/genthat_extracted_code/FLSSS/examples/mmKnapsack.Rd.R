library(FLSSS)


### Name: mmKnapsack
### Title: Multithreaded multidimensional Knapsack problem solver
### Aliases: mmKnapsack

### ** Examples

# =====================================================================================
# Play random numbers
# =====================================================================================
rm(list = ls()); gc()
subsetSize = 6
supersetSize = 60
NcostsAttr = 4

## No test: 
  # Make up costs for each item.
  costs = abs(6 * (rnorm(supersetSize * NcostsAttr) ^ 3 +
                     2 * runif(supersetSize * NcostsAttr) ^ 2 +
                     3 * rgamma(supersetSize * NcostsAttr, 5, 1) + 4))
  costs = matrix(costs, ncol = NcostsAttr)


  # Make up cost limits.
  budgets = apply(costs, 2, function(x)
  {
    x = sort(x)
    Min = sum(x[1L : subsetSize])
    Max = sum(x[(supersetSize - subsetSize + 1L) : supersetSize])
    runif(1, Min, Max)
  })


  # Make up item profits.
  gains = rnorm(supersetSize) ^ 2 * 10000 + 100


  rst1 = FLSSS::mmKnapsack(
    maxCore = 2L, len = subsetSize, itemsProfits = gains, itemsCosts = costs,
    capacities = budgets, heuristic = FALSE, tlimit = 60, useBiSrchInFB = FALSE,
    threadLoad = 4L, verbose = TRUE)


  # Let 'x' be the solution given 'heuristic = TRUE'. The sum of ranks of the
  # profits subsetted by 'x' would be no less than that of the optimal solution.
  rst2 = FLSSS::mmKnapsack(
    maxCore = 2L, len = subsetSize, itemsProfits = gains, itemsCosts = costs,
    capacities = budgets, heuristic = TRUE, tlimit = 60, useBiSrchInFB = FALSE,
    threadLoad = 4L, verbose = TRUE)


  # Exam difference in total profits given by the heuristic and the optimal:
  cat(length(rst1$solution)); cat(length(rst2$solution)) # See if solution exists.
  if(length(rst1$solution) > 0 & length(rst2$solution) > 0)
    sum(gains[rst2$solution]) / sum(gains[rst1$solution])
## End(No test)




# =====================================================================================
# Test case P08 from
# https://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html
# =====================================================================================
rm(list = ls()); gc()
costs = matrix(c(382745, 799601, 909247, 729069, 467902,  44328,  34610, 698150,
                 823460, 903959, 853665, 551830, 610856, 670702, 488960, 951111,
                 323046, 446298, 931161,  31385, 496951, 264724, 224916, 169684),
               ncol = 1)


gains = c( 825594, 1677009, 1676628, 1523970,  943972,   97426,  69666, 1296457,
           1679693, 1902996, 1844992, 1049289, 1252836, 1319836, 953277, 2067538,
           675367,  853655, 1826027,   65731,  901489,  577243, 466257,  369261)


budgets = 6404180


# 'mmKnapsack()' is designed for the multidimensional Knapsack and may not
# be ideal for one-dimensional 0-1 Knapsack regarding computing speed.
# 'len = 0' causes substantial deceleration. Looping 'len' over possible
# values is recommended if 'len' is ungiven.
rst1 = FLSSS::mmKnapsack(
  maxCore = 2L, len = 12L, itemsProfits = gains, itemsCosts = costs,
  capacities = budgets, heuristic = FALSE, tlimit = 2, threadLoad = 4L,
  verbose = TRUE)
rst1 = sort(rst1$solution)


cat("Correct solution:\n1 2 4 5 6 10 11 13 16 22 23 24\nFLSSS solution =\n")
cat(rst1, "\n")




# =====================================================================================
# Test case P07 from
# https://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html
# =====================================================================================
costs = matrix(c(70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120),
               ncol = 1)


gains = c(135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240)


budgets = 750


rst2 = FLSSS::mmKnapsack(
  maxCore = 2L, len = 8L, itemsProfits = gains, itemsCosts = costs,
  capacities = budgets, heuristic = FALSE, tlimit = 2,
  threadLoad = 4L, verbose = TRUE)
rst2 = sort(rst2$solution)


cat("Correct solution:\n1 3 5 7 8 9 14 15\nFLSSS solution =\n")
cat(rst2, "\n")



