library(nimble)


### Name: Constraint
### Title: Constraint calculations in NIMBLE
### Aliases: Constraint dconstraint rconstraint

### ** Examples

constr <- 3 > 2 && 4 > 0
x <- rconstraint(1, constr)
dconstraint(x, constr)
dconstraint(0, 3 > 4)
dconstraint(1, 3 > 4)
rconstraint(1, 3 > 4)



