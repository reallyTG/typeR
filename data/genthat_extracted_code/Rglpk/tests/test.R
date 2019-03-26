
library(Rglpk)

##
## Example 1
##
obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE

s <- Rglpk_solve_LP(obj, mat, dir, rhs, max = max)
stopifnot(sum(abs(s$solution - c(0, 20/3, 50/3))) < 1e-4)


##
## Example 2
##
obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
types <- c("I", "C", "I")
max <- TRUE

s <- Rglpk_solve_LP(obj, mat, dir, rhs, types = types, max = max)
stopifnot(sum(abs(s$solution - c(5, 11/4, 3))) < 1e-4)


##
## Example 3
##
bounds <- list(lower = list(ind = c(1L, 3L), val = c(-Inf, 2)),
               upper = list(ind = c(1L, 2L), val = c(4, 100)))
s <- Rglpk_solve_LP(obj, mat, dir, rhs, bounds, types, max)
stopifnot(sum(abs(s$solution - c(4, 10/4, 3))) < 1e-4)


##
## Example 4
##
types <- c("B", "B", "B")
s <- Rglpk_solve_LP(obj, mat, dir, rhs, bounds, types, max)
stopifnot(sum(abs(s$solution - c(1, 1, 1))) < 1e-4)


##
## Example 5
##
types <- c("I", "B", "I")
s <- Rglpk_solve_LP(obj, mat, dir, rhs, bounds, types, max)
s$solution
stopifnot(sum(abs(s$solution - c(2, 1, 2))) < 1e-4)


##
## Example 6
##
mat <- rbind(mat, c(1, 1, 0))
dir <- c(dir, "==")
rhs <- c(rhs, 1)
types <- c("B", "B", "B")
s <- Rglpk_solve_LP(obj, mat, dir, rhs, bounds, types, max)
stopifnot(sum(abs(s$solution - c(1, 0, 1))) < 1e-4)
