library(OptimalDesign)


### Name: od.crit
### Title: Optimality criterion
### Aliases: od.crit

### ** Examples

# The matrix of regressors for the spring balance weighing model with 
# 6 weighed items.
F.sbw <- F.cube(~x1 + x2 + x3 + x4 + x5 + x6 - 1, rep(0, 6), 
                rep(1, 6), rep(2, 6))

# The value of all 3 optimality criteria for the design of size 15 
# that weighs each pair of items exactly once.
w2 <- rep(0, 64); w2[apply(F.sbw, 1, sum)==2] <- 1
od.crit(F.sbw, w2, "D")
od.crit(F.sbw, w2, "A")
od.crit(F.sbw, w2, "IV")

# The value of all 3 optimality criteria for the design of size 15 that 
# weighs each quadruple of items exactly once.
w4 <- rep(0, 64); w4[apply(F.sbw, 1, sum)==4] <- 1
od.crit(F.sbw, w4, "D")
od.crit(F.sbw, w4, "A")
od.crit(F.sbw, w4, "IV")



