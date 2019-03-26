library(hitandrun)


### Name: transformConstraints
### Title: Apply a transformation to a set of linear constraints.
### Aliases: transformConstraints
### Keywords: transform constraint

### ** Examples

# Sample from the space where 2*x_1 = x_2 + x_3 and
# 0 <= x_1, x_2, x_3 <= 5
n <- 3

eq.constr <- list(
  constr = matrix(c(2, -1, -1), nrow=1, ncol=n),
  dir = '=',
  rhs = 0)

ineq.constr <- list(
  constr = rbind(-diag(n), diag(n)),
  dir = rep('<=', n * 2),
  rhs = c(rep(0, n), rep(5, n)))

basis <- solution.basis(eq.constr)
transform <- createTransform(basis)
constr <- transformConstraints(transform, ineq.constr)
x0 <- createSeedPoint(constr, homogeneous=TRUE)
x <- har(x0, constr, 500, transform=transform, homogeneous=TRUE)$samples

stopifnot(all.equal(2 * x[,1], x[,2] + x[,3]))
stopifnot(all(x >= 0))
stopifnot(all(x <= 5))



