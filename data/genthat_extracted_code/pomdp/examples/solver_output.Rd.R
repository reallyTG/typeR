library(pomdp)


### Name: solver_output
### Title: Display the Output of the POMDP Solver
### Aliases: solver_output
### Keywords: optimize

### ** Examples

data("TigerProblem")
sol <- solve_POMDP(model = TigerProblem)

## solver output
solver_output(sol)



