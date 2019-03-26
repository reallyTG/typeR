library(limSolve)


### Name: ldei
### Title: Weighted Least Distance Programming with equality and inequality
###   constraints.
### Aliases: ldei
### Keywords: algebra array optimize

### ** Examples

#-------------------------------------------------------------------------------
# A simple problem
#-------------------------------------------------------------------------------
# minimise x1^2 + x2^2 + x3^2 + x4^2 + x5^2 + x6^2
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
ldei(E, F, G, H)

#-------------------------------------------------------------------------------
# parsimonious (simplest) solution of the mink diet problem
#-------------------------------------------------------------------------------
E <- rbind(Minkdiet$Prey, rep(1, 7))
F <- c(Minkdiet$Mink, 1)

parsimonious <- ldei(E, F, G = diag(7), H = rep(0, 7))
data.frame(food = colnames(Minkdiet$Prey),
           fraction = parsimonious$X)
dotchart(x = as.vector(parsimonious$X),
         labels = colnames(Minkdiet$Prey),
         main = "Diet composition of Mink extimated using ldei",
         xlab = "fraction")
         



