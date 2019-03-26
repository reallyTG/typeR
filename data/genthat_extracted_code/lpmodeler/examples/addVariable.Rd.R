library(lpmodeler)


### Name: addVariable
### Title: Add a new variable to a LP or MIP
### Aliases: addVariable

### ** Examples

p <- newProblem()

# add an integer variable called x to the
# problem, and set its coefficient in the
# objective function to a value of 5.
p <- addVariable(p, "I", 5, "x")



