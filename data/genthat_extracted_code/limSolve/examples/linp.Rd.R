library(limSolve)


### Name: linp
### Title: Linear Programming.
### Aliases: linp
### Keywords: algebra array optimize

### ** Examples

#-------------------------------------------------------------------------------
# Linear programming problem 1, not feasible
#-------------------------------------------------------------------------------

# maximise x1 + 3*x2 
# subject to
#-x1 -x2    < -3
#-x1 + x2   <-1
# x1 + 2*x2 < 2
# xi > 0

G    <- matrix(nrow = 3, data = c(-1, -1, 1, -1, 1, 2))
H    <- c(3, -1, 2)
Cost <- c(-1, -3)
(L <- linp(E = NULL, F = NULL, Cost = Cost, G = G, H = H))
L$residualNorm

#-------------------------------------------------------------------------------
# Linear programming problem 2, feasible
#-------------------------------------------------------------------------------

# minimise x1 + 8*x2 + 9*x3 + 2*x4 + 7*x5 + 3*x6  
# subject to:
#-x1            + x4 + x5      = 0
#    - x2       - x4      + x6 = 0
# x1 + x2 + x3                 > 1
#           x3       + x5 + x6 < 1
# xi > 0

E <- matrix(nrow = 2, byrow = TRUE, data = c(-1, 0, 0, 1, 1, 0,
                                              0,-1, 0, -1, 0, 1))
F <- c(0, 0)
G <- matrix(nrow = 2, byrow = TRUE, data = c(1, 1, 1, 0, 0, 0,
                                             0, 0, -1, 0, -1, -1))
H    <- c(1, -1)
Cost <- c(1, 8, 9, 2, 7, 3)
(L <- linp(E = E, F = F, Cost = Cost, G = G, H = H))
L$residualNorm

#-------------------------------------------------------------------------------
# Linear programming problem 3, no positivity
#-------------------------------------------------------------------------------
# minimise x1 + 2x2 -x3 +4 x4
# subject to:
# 3x1 + 2x2 + x3 + x4 = 2
#  x1 +  x2 + x3 + x4 = 2

# 2x1 +  x2 + x3 + x4 >=-1
# -x1 + 3x2 +2x3 + x4 >= 2
# -x1       + x3      >= 1

E <- matrix(ncol = 4, byrow = TRUE,
            data =c(3, 2, 1, 4, 1, 1, 1, 1))
F <- c(2, 2)

G <- matrix(ncol = 4, byrow = TRUE,
            data = c(2, 1, 1, 1, -1, 3, 2, 1, -1, 0, 1, 0))
H <- c(-1, 2, 1)
Cost <- c(1, 2, -1, 4)

linp(E = E, F = F, G = G, H = H, Cost, ispos = FALSE)



