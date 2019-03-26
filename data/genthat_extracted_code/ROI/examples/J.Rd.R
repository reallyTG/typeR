library(ROI)


### Name: J
### Title: Extract Jacobian Information
### Aliases: J J.L_constraint J.Q_constraint

### ** Examples

L <- matrix(c(3, 4, 2, 2, 1, 2, 1, 3, 2), nrow=3, byrow=TRUE)
lc <- L_constraint(L = L, dir = c("<=", "<=", "<="), rhs = c(60, 40, 80))
J(lc)



