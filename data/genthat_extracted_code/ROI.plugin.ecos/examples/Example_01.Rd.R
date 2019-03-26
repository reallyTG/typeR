library(ROI.plugin.ecos)


### Name: Example-1
### Title: SOCP 1

### ** Examples


library(ROI)
obj <- L_objective(c(1, 1))
## NOTE: chol(diag(2)) == diag(2)
con <- C_constraint(L = rbind(0, -diag(2)), 
                    cones = K_soc(3), 
                    rhs = c(1, 0, 0))
op <- OP(obj, con, maximum=TRUE)
x <- ROI_solve(op, solver="ecos")
x
## Optimal solution found.
## The objective value is: 1.414214e+00
solution(x)
## [1] 0.7071068 0.7071068




