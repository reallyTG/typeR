library(lpmodeler)


### Name: addConstraint
### Title: Add a new constraint to a LP or MIP
### Aliases: addConstraint

### ** Examples

p <- newProblem()

# add variables x and y
p <- addVariable(p, "C", 5, "x")
p <- addVariable(p, "C", 4, "y")

# add the constraint: x + 2y >= 5
p <- addConstraint(p, ">=", 5, c(1, 2), name = "x+2y greater or equal than 5")

# add the empty constraint: <= 10
p <- addConstraint(p, "<=", 10, name = "less or equal than 10")



