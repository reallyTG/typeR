library(ROI.plugin.msbinlp)


### Name: Example-2
### Title: Multiple Solutions - Binary LP

### ** Examples

## Not run: 
##D library(ROI)
##D op <- OP()
##D objective(op) <- L_objective(c(-1, -1, -1, -1, -99))
##D mat <- simple_triplet_matrix(rep(1:3, 2), 
##D                              c(c(1, 3, 4), c(2, 4, 5)), 
##D                              rep(1, 6))
##D constraints(op) <- L_constraint(mat, 
##D                                dir = leq(3), 
##D                                rhs = rep.int(1, 3))
##D types(op) <- rep("B", length(op))
##D 
##D x <- ROI_solve(op, solver = "msbinlp", method = "glpk", nsol_max = 2L)
##D x 
##D ## 2 optimal solutions found.
##D ## The objective value is: -1.010000e+02
##D solution(x)
##D ## [[1]]
##D ## [1] 0 1 1 0 1
##D ## 
##D ## [[2]]
##D ## [1] 1 0 1 0 1
## End(Not run)



