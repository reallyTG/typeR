library(RcppDynProg)


### Name: solve_interval_partition
### Title: solve_interval_partition interval partition problem.
### Aliases: solve_interval_partition

### ** Examples


costs <- matrix(c(1.5, NA ,NA ,1 ,0 , NA, 5, -1, 1), nrow = 3)
solve_interval_partition(costs, nrow(costs))




