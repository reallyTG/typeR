library(adagio)


### Name: knapsack
### Title: 0-1 Knapsack Problem
### Aliases: knapsack
### Keywords: optimize

### ** Examples

# Example 1
p <- c(15, 100, 90, 60, 40, 15, 10,  1)
w <- c( 2,  20, 20, 30, 40, 30, 60, 10)
cap <- 102
(is <- knapsack(w, p, cap))
# [1] 1 2 3 4 6 , capacity 102 and total profit 280

## Example 2
p <- c(70, 20, 39, 37, 7, 5, 10)
w <- c(31, 10, 20, 19, 4, 3,  6)
cap <- 50
(is <- knapsack(w, p, cap))
# [1] 1 4 , capacity 50 and total profit 107



