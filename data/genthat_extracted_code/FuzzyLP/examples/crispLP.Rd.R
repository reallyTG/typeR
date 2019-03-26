library(FuzzyLP)


### Name: crispLP
### Title: Solves a crisp linear programming problem.
### Aliases: crispLP

### ** Examples

## maximize:   3*x1 + x2
## s.t.:       1.875*x1   - 1.5*x2 <= 4
##              4.75*x1 + 2.125*x2 <= 14.5
##               x1, x2 are non-negative real numbers

obj <- c(3, 1)
A <- matrix(c(1.875, 4.75, -1.5, 2.125), nrow = 2)
dir <- c("<=", "<=")
b <- c(4, 14.5)
max <- TRUE

crispLP(obj, A, dir, b, maximum = max, verbose = TRUE)




