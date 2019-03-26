library(ROI.plugin.scs)


### Name: Example-3
### Title: SOCP 3

### ** Examples


library(ROI)
lo <- L_objective(c(-2, 1, 5))
lc1 <- rbind(c(12, 6, -5), c(13, -3, -5), c(12, -12, 6))
lc2 <- rbind(c(3, -6, 10), c(3, -6, -2), c(-1, -9, -2), c(1, 19, -3))
lc <- C_constraint(L = rbind(lc1, lc2), 
                   cones = K_soc(c(3, 4)), 
                   rhs = c(c(-12, -3, -2), c(27, 0, 3, -42)))
vb <- V_bound(li=1:3, lb=rep(-Inf, 3))
op <- OP(objective = lo, constraints = lc, bounds = vb)
x <- ROI_solve(op, solver="scs")
x
## Optimal solution found.
## The objective value is: -3.834637e+01
solution(x)
## [1] -5.014767 -5.766924 -8.521796



