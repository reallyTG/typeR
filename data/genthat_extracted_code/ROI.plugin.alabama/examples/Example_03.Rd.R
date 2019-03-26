library(ROI.plugin.alabama)


### Name: Example-3
### Title: Hock-Schittkowski-Collection Problem 36

### ** Examples


library(ROI)

hs036_obj <- function(x) {
    -x[1] * x[2] * x[3]
}

hs036_con <- function(x) {
    x[1] + 2 * x[2] + 2 * x[3]
}


x <- OP( objective = F_objective(hs036_obj, n = 3L), 
         constraints = F_constraint(hs036_con, "<=", 72),
         bounds = V_bound(ub = c(20, 11, 42)) )

nlp <- ROI_solve(x, solver = "alabama", start = c(10, 10, 10))
nlp
## Optimal solution found.
## The objective value is: -3.300000e+03
solution(nlp, "objval")
## [1] -3300
solution(nlp)
## [1] 20 11 15




