## ROI test suite


## Configuration
suppressPackageStartupMessages( require("ROI") )
## solver to check
solver <- "glpk"
## load and register plug-in
require( sprintf("ROI.plugin.%s", solver), character.only = TRUE )

## From Rglpk_solve_LP man page

## Example 1:
## Simple linear program.
## maximize:   2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
##             2 x_1 +   x_2 +   x_3 <= 40
##               x_1 + 3 x_2 + 2 x_3 <= 80
##               x_1, x_2, x_3 are non-negative real numbers
ex1_lp <- OP(objective = c(2, 4, 3),
             constraints = L_constraint(L = matrix(c(3, 2, 1, 4, 1,
                                                     3, 2, 2, 2), nrow = 3),
               dir = c("<=", "<=", "<="),
               rhs = c(60, 40, 80)),
             maximum = TRUE)


res <- ROI_solve( ex1_lp, solver = solver )

solution( res )
solution( res, "dual" )
solution( res, "aux" )
solution( res, "msg" )

## Example 2:
## Simple mixed integer linear program.
## maximize:    3 x_1 + 1 x_2 + 3 x_3
## subject to: -1 x_1 + 2 x_2 +   x_3 <= 4
##                      4 x_2 - 3 x_3 <= 2
##                x_1 - 3 x_2 + 2 x_3 <= 3
##                x_1, x_3 are non-negative integers
##                x_2 is a non-negative real number

ex2_milp <- OP(objective = c(3, 1, 3),
               constraints = L_constraint(L = matrix(c(-1, 0, 1, 2, 4, -3,
                                          1, -3, 2), nrow = 3),
               dir = c("<=", "<=", "<="),
               rhs = c(4, 2, 3)),
               types = c("I", "C", "I"),
               maximum = TRUE)

res <- ROI_solve( ex2_milp, solver = solver )

solution( res )
solution( res, "dual" )
solution( res, "aux" )
solution( res, "msg" )

## Example 3:
## MILP same as in Example 2 but with bounds replaced by
## -Inf <  x_1 <= 4
##    0 <= x_2 <= 100
##    2 <= x_3 <  Inf

ex3a_milp <- OP(objective = c(3, 1, 3),
                 constraints = L_constraint(L = matrix(c(-1,  0, 1,  2,
                                                          4, -3, 1, -3, 2),
                                                       nrow = 3),
                                            dir = c("<=", "<=", "<="),
                                            rhs = c(4, 2, 3)),
                 types = c("I", "C", "I"),
                 bounds = V_bound( li = c(1L, 3L),  ui = c(1L, 2L),
                                   lb = c(-Inf, 2), ub = c(4, 100) ),
                 maximum = TRUE)

res <- ROI_solve( ex3a_milp, solver = solver )

solution( res )
solution( res, "dual" )
solution( res, "aux" )
solution( res, "msg" )

## force negative values in solution
ex3b_milp <- ex3a_milp
## FIXME: sanity check on replacement implemented?
bounds(ex3b_milp) <- V_bound( c(1L, 2L, 3L), c(1L, 2L),
                              c(-Inf, -Inf, 2), c(4, -0.5) )

res <- ROI_solve(ex3b_milp, solver = solver)

solution( res )
solution( res, "dual" )
solution( res, "aux" )
solution( res, "msg" )

## no boxes
ex3c_milp <-ROI:::as.no_V_bounds_OP(ex3b_milp)

res <- ROI_solve(ex3b_milp, solver = solver)

solution( res )
solution( res, "dual" )
solution( res, "aux" )
solution( res, "msg" )
