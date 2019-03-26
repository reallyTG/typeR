library(ROI.plugin.msbinlp)


### Name: Example-1
### Title: Multiple Solutions - Binary LP

### ** Examples

## Not run: 
##D library(ROI)
##D op <- OP(objective = c(1, 1),
##D          constraints = L_constraint(c(1, 1), "==", 1),
##D          types = c("B", "B"))
##D 
##D x <- ROI_solve(op, solver = "msbinlp", method = "glpk", nsol_max = 2L)
##D x
##D ## 2 optimal solutions found.
##D ## The objective value is: 1.000000e+00
##D solution(x)
##D ## [[1]]
##D ## [1] 1 0
##D ##
##D ## [[2]]
##D ## [1] 0 1
## End(Not run)



