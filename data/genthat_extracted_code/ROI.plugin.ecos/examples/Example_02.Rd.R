library(ROI.plugin.ecos)


### Name: Example-2
### Title: SOCP 2

### ** Examples


library(ROI)
obj <- L_objective(c(1, -1))
L <- chol(rbind(c(3, -1), c(-1, 1)))
con <- C_constraint(L = rbind(0, -L), 
                    cones = K_soc(3), 
                    rhs = c(1, 0, 0))
op <- OP(objective = obj, constraints = con, 
         bounds = V_bound(li=1:2, lb=rep(-Inf, 2)))
x <- ROI_solve(op, solver="ecos")
x
## Optimal solution found.
## The objective value is: -1.000000e+00
solution(x)
## [1] 1.996387e-10 1.000000e+00




