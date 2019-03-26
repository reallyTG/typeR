library(ROI.plugin.deoptim)


### Name: Example-1
### Title: Banana

### ** Examples


library(ROI)

f <- function(x) {
    return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
}

x <- OP( objective = F_objective(f, n=2L, names=c("x_1", "x_2")), 
         bounds = V_bound(li=1:2, ui=1:2, lb=c(-3, -3), ub=c(3,  3)) )

nlp <- ROI_solve(x, solver="deoptim")
nlp
## Optimal solution found.
## The objective value is: 3.828383e-22
solution(nlp)
## x_1 x_2 
##   1   1 




