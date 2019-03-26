## ROI test suite

## Configuration
suppressPackageStartupMessages( require("ROI") )
## solver to check
solver <- "ipop"
## load and register plug-in
require( sprintf("ROI.plugin.%s", solver), character.only = TRUE )

## Example 5:
## Another QP (this is qpex1.c in the CPLEX examples)
## maximize:     x_1 + 2 x_2 + 3  x_3 - 1/2 (33 x_1^2 + 22 x_2^2 + 11 x_3^2) + 6 x_1 x_2 + 11.5 x_2 x_3
## subject to: - x_1 +   x_2 +    x_3 <= 20
##               x_1 - 3 x_2 +    x_3 <= 30
##

ex5_qp <- OP( Q_objective(Q = matrix(c(-33, 6, 0, 6, -22, 11.5, 0, 11.5, -11),
                        byrow = TRUE, ncol = 3),
                      L = c(1, 2, 3)),
          L_constraint(L = matrix(c(-1, 1, 1, 1, -3, 1),
                         byrow = TRUE, ncol = 3),
                       dir = rep("<=", 2),
                       rhs = c(20, 30)),
         maximum = TRUE)

res <- ROI_solve(ex5_qp, solver = solver)

solution( res )
solution( res, "dual" )
solution( res, "msg" )

## Example 10: QP
## Solve the portfolio optimization problem

## portfolio optimization
data( US30 )
r <- na.omit( US30 )
## objective function to minimize
obj <- Q_objective( 2*cov(r) )
## full investment constraint
full_invest <- L_constraint( rep(1, ncol(US30)), "==", 1 )
## create optimization problem / long-only
ex10_qp <- OP( objective = obj, constraints = full_invest )
## solve the problem - only works if a QP solver is registered

res <- ROI_solve(ex10_qp, solver = solver)

round( solution(res), 3 )
solution( res, "dual" )
solution( res, "msg" )
