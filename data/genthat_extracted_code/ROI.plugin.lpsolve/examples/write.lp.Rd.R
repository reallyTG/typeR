library(ROI.plugin.lpsolve)


### Name: write.lp
### Title: Write Optimization Problem
### Aliases: write.lp

### ** Examples

## Not run: 
##D mat <- matrix(c(3, 4, 2,
##D                 2, 1, 2,
##D                 1, 3, 2), nrow=3, byrow=TRUE)
##D x <- OP(objective = c(2, 4, 3),
##D         constraints = L_constraint(L = mat,
##D                                    dir = c("<=", "<=", "<="),
##D                                    rhs = c(60, 40, 80)),
##D         bounds = V_bound(ui = seq_len(3), ub = c(1000, Inf, 1000), nobj = 3),
##D         maximum = TRUE)
##D write.lp(x, "optimization_problem.lp")
## End(Not run)



