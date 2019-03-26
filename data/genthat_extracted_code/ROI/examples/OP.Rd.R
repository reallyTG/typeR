library(ROI)


### Name: OP
### Title: Optimization Problem Constructor
### Aliases: OP as.OP

### ** Examples

## Simple linear program.
## maximize:   2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
##             2 x_1 +   x_2 +   x_3 <= 40
##               x_1 + 3 x_2 + 2 x_3 <= 80
##               x_1, x_2, x_3 are non-negative real numbers

LP <- OP( c(2, 4, 3),
          L_constraint(L = matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3),
                       dir = c("<=", "<=", "<="),
                       rhs = c(60, 40, 80)),
          max = TRUE )
LP

## Simple quadratic program.
## minimize: - 5 x_2 + 1/2 (x_1^2 + x_2^2 + x_3^2)
## subject to: -4 x_1 - 3 x_2       >= -8
##              2 x_1 +   x_2       >=  2
##                    - 2 x_2 + x_3 >=  0

QP <- OP( Q_objective (Q = diag(1, 3), L = c(0, -5, 0)),
          L_constraint(L = matrix(c(-4,-3,0,2,1,0,0,-2,1),
                                  ncol = 3, byrow = TRUE),
                       dir = rep(">=", 3),
                       rhs = c(-8,2,0)) )
QP



