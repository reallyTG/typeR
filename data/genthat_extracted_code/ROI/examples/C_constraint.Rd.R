library(ROI)


### Name: C_constraint
### Title: Conic Constraints
### Aliases: C_constraint as.C_constraint is.C_constraint
###   length.C_constraint variable.names.C_constraint terms.C_constraint

### ** Examples

## minimize:  x1 + x2 + x3
## subject to: 
##   x1 == sqrt(2)
##   ||(x2, x3)|| <= x1
x <- OP(objective = c(1, 1, 1), 
        constraints = C_constraint(L = rbind(rbind(c(1, 0, 0)), 
                                             diag(x=-1, 3)), 
                                   cones = c(K_zero(1), K_soc(3)), 
                                   rhs = c(sqrt(2), rep(0, 3))), 
        types = rep("C", 3),
        bounds =  V_bound(li = 1:3, lb = rep(-Inf, 3)), maximum = FALSE)



