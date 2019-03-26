library(pomdp)


### Name: model
### Title: Extract the User-defined Model Components from a Solved POMDP
### Aliases: model

### ** Examples

data("TigerProblem")
tiger_solved <- solve_POMDP(model = TigerProblem)
tiger_solved

model(tiger_solved)



