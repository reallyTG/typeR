library(ROI)


### Name: types (Set/Get)
### Title: Types - Accessor and Mutator Functions
### Aliases: 'types (Set/Get)' types types<-

### ** Examples

## minimize: x + 2 y
## subject to: x + y >= 1
## x, y >= 0    x, y are integer
x <- OP(objective = 1:2, constraints = L_constraint(c(1, 1), ">=", 1))
types(x) <- c("I", "I")
types(x)



