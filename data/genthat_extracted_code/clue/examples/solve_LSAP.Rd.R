library(clue)


### Name: solve_LSAP
### Title: Solve Linear Sum Assignment Problem
### Aliases: solve_LSAP
### Keywords: optimize

### ** Examples

x <- matrix(c(5, 1, 4, 3, 5, 2, 2, 4, 4), nrow = 3)
solve_LSAP(x)
solve_LSAP(x, maximum = TRUE)
## To get the optimal value (for now):
y <- solve_LSAP(x)
sum(x[cbind(seq_along(y), y)])



