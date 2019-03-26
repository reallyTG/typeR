library(rosqp)


### Name: solve_osqp
### Title: Sparse Quadratic Programming Solver
### Aliases: solve_osqp

### ** Examples

library(rosqp)
## example, adapted from ?quadprog::solve.QP
Dmat       <- diag(3)
dvec       <- c(0,-5,0)
Amat       <- matrix(c(-4, 2, 0, -3, 1, -2, 0, 0, 1),3,3)
bvec       <- c(-8,2,0)
res = solve_osqp(Dmat, dvec, Amat, bvec)
print(res$x)






