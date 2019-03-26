library(ROI)


### Name: equal
### Title: Compare two Objects
### Aliases: equal equal.NULL equal.logical equal.integer equal.numeric
###   equal.character equal.list equal.simple_triplet_matrix
###   equal.L_constraint equal.Q_constraint equal.V_bound

### ** Examples

## compare numeric values
equal(1e-4, 1e-5, tol=1e-3)
## L_constraint
lc1 <- L_constraint(diag(1), dir=c("=="), rhs=1)
lc2 <- L_constraint(diag(2), dir=c("==", "<="), rhs=1:2)
equal(lc1, lc1)
equal(lc1, lc2)



