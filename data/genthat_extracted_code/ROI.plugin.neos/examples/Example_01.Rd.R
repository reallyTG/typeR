library(ROI.plugin.neos)


### Name: Example-1
### Title: Linear Problem 1

### ** Examples

## Not run: 
##D library(ROI)
##D mat <- matrix(c(3, 4, 2,
##D                 2, 1, 2,
##D                 1, 3, 2), nrow=3, byrow=TRUE)
##D x <- OP(objective = c(2, 4, 3),
##D         constraints = L_constraint(L = mat,
##D                                    dir = c("<=", "<=", "<="),
##D                                    rhs = c(60, 40, 80)),
##D         maximum = TRUE)
##D 
##D 
##D opt <- ROI_solve(x, solver = "neos", method = "scip")
##D opt
##D ## Optimal solution found.
##D ## The objective value is: 7.666667e+01
##D solution(opt)
##D ## [1]  0.000000  6.666667 16.666667
## End(Not run)



