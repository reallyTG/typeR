library(ROI)


### Name: constraints (Set/Get)
### Title: Constraints - Accessor and Mutator Functions
### Aliases: 'constraints (Set/Get)' constraints constraints.OP
###   constraints<-

### ** Examples

## minimize: x + 2 y
## subject to: x + y >= 1
## x, y >= 0
x <- OP(1:2)
constraints(x) <- L_constraint(c(1, 1), ">=", 1)
constraints(x)



