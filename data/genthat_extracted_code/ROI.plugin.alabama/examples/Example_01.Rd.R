library(ROI.plugin.alabama)


### Name: Example-1
### Title: Banana

### ** Examples

library(ROI)

f <- function(x) {
    return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
}

f.gradient <- function(x) {
    return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
               200 * (x[2] - x[1] * x[1])) )
}

x <- OP(objective = F_objective(f, n = 2L, G = f.gradient), 
        bounds = V_bound(li = 1:2, ui = 1:2, lb = c(-3, -3), ub = c(3,  3)))

nlp <- ROI_solve(x, solver = "alabama", start = c(-2, 2.4), method = "BFGS")
nlp
## Optimal solution found.
## The objective value is: 3.049556e-23
solution(nlp)
## [1] 1 1



