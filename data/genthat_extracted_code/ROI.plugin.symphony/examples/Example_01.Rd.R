library(ROI.plugin.symphony)


### Name: Example-1
### Title: Linear Problem 1

### ** Examples


require("ROI")
mat <- matrix(c(3, 4, 2,
                2, 1, 2,
                1, 3, 2), nrow=3, byrow=TRUE)
x <- OP(objective = c(2, 4, 3),
        constraints = L_constraint(L = mat,
                                   dir = c("<=", "<=", "<="),
                                   rhs = c(60, 40, 80)),
        maximum = TRUE)


opt <- ROI_solve(x, solver = "symphony")
opt
## Optimal solution found.
## The objective value is: 7.666667e+01
solution(opt)
## [1]  0.000000  6.666667 16.666667




