library(ROI.plugin.deoptim)


### Name: Example-2
### Title: Hock-Schittkowski-Collection Problem 16

### ** Examples

library(ROI)

f <- function(x) {
    return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
}

f.gradient <- function(x) {
    return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
               200 * (x[2] - x[1] * x[1])) )
}

x <- OP( objective = F_objective(f, n=2L, G=f.gradient), 
         constraints = c(F_constraint(F=function(x) x[1] + x[2]^2, ">=", 0,
                                      J=function(x) c(1, 2*x[2])),
                         F_constraint(F=function(x) x[1]^2 + x[2], ">=", 0,
                                      J=function(x) c(2*x[1], x[2]))),
         bounds = V_bound(li=1:2, ui=1:2, lb=c(-2, -Inf), ub=c(0.5,  1)) )

nlp <- ROI_solve(x, solver="alabama", start=c(-2, 1))
nlp
## Optimal solution found.
## The objective value is: 2.499999e-01
solution(nlp)
## [1] 0.5000001 0.2499994



