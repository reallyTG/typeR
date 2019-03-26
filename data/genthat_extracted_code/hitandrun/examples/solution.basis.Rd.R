library(hitandrun)


### Name: solution.basis
### Title: Calculate the basis for the solution space of a system of linear
###   equations
### Aliases: solution.basis
### Keywords: transform

### ** Examples

# A 3-dimensional original space
n <- 3

# x_1 + x_2 + x_3 = 1
eq.constr <- list(constr = t(rep(1, n)), dir = '=', rhs = 1)
basis <- solution.basis(eq.constr)
stopifnot(ncol(basis$basis) == 2) # Dimension reduced to 2
y <- rbind(rnorm(100, 0, 100), rnorm(100, 0, 100))
x <- basis$basis %*% y + basis$translate
stopifnot(all.equal(apply(x, 2, sum), rep(1, 100)))

# 2 x_2 = x_1; 2 x_3 = x_2
eq.constr <- mergeConstraints(
  eq.constr,
  list(constr = c(-1, 2, 0), dir = '=', rhs = 0),
  list(constr = c(0, -1, 2), dir = '=', rhs = 0))
basis <- solution.basis(eq.constr)
stopifnot(ncol(basis$basis) == 0) # Dimension reduced to 0
stopifnot(all.equal(basis$translate, c(4/7, 2/7, 1/7)))



