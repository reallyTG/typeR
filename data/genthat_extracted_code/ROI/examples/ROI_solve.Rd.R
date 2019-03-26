library(ROI)


### Name: ROI_solve
### Title: Solve an Optimization Problem
### Aliases: ROI_solve

### ** Examples

## Rosenbrock Banana Function
## -----------------------------------------
## objective
f <- function(x) {
   return( 100 * (x[2] - x[1] * x[1])^2 + (1 - x[1])^2 )
}
## gradient
g <- function(x) {
   return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
             200 * (x[2] - x[1] * x[1])) )
}
## bounds
b <- V_bound(li = 1:2, ui = 1:2, lb = c(-3, -3), ub = c(3, 3))
op <- OP( objective = F_objective(f, n = 2L, G = g),
          bounds = b )
res <- ROI_solve( op, solver = "nlminb", control = list(start = c( -1.2, 1 )) )
solution( res )
## Portfolio optimization - minimum variance
## -----------------------------------------
## get monthly returns of 30 US stocks
data( US30 )
r <- na.omit( US30 )
## objective function to minimize
obj <- Q_objective( 2*cov(r) )
## full investment constraint
full_invest <- L_constraint( rep(1, ncol(US30)), "==", 1 )
## create optimization problem / long-only
op <- OP( objective = obj, constraints = full_invest )
## solve the problem - only works if a QP solver is registered
## Not run: 
##D res <- ROI_solve( op )
##D res
##D sol <- solution( res )
##D names( sol ) <- colnames( US30 )
##D round( sol[ which(sol > 1/10^6) ], 3 )
## End(Not run)



