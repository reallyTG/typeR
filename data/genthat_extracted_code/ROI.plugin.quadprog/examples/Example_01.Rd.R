library(ROI.plugin.quadprog)


### Name: Example-1
### Title: Quadratic Problem 1

### ** Examples


require("ROI")
A <- cbind(c(-4, -3, 0), 
           c( 2,  1, 0), 
           c( 0, -2, 1))
x <- OP(Q_objective(diag(3), L =  c(0, -5, 0)),
        L_constraint(L = t(A),
                     dir = rep(">=", 3),
                     rhs = c(-8, 2, 0)))

opt <- ROI_solve(x, solver="quadprog")
opt
## Optimal solution found.
## The objective value is: -2.380952e+00
solution(opt)
## [1]  0.4761905 1.0476190 2.0952381




