library(limSolve)


### Name: xsample
### Title: Randomly samples an underdetermined problem with linear equality
###   and inequality constraints
### Aliases: xsample
### Keywords: algebra array optimize

### ** Examples

#-------------------------------------------------------------------------------
# A simple problem
#-------------------------------------------------------------------------------
# Sample the probability density function of x1,...x4
# subject to:
# x1 + x2       + x4 = 3
#      x2  -x3  + x4 = -1
# xi   > 0

E <- matrix(nrow = 2, byrow = TRUE, data = c(1, 1, 0,  1,
                                             0, 1, -1, 1))
F   <- c(3, -1)
G   <- diag (nrow = 4)
H   <- rep(0, times = 4)
xs  <- xsample(E = E, F = F, G = G, H = H)
pairs(xs)

#-------------------------------------------------------------------------------
# Sample the underdetermined Mink diet problem
#-------------------------------------------------------------------------------
E <- rbind(Minkdiet$Prey, rep(1, 7))
F <- c(Minkdiet$Mink, 1)

pairs(xsample(E = E, F = F, G = diag(7), H = rep(0, 7), iter = 5000,
      output = 1000, type = "cda")$X,
      main = "Minkdiet 1000 solutions, - cda")



