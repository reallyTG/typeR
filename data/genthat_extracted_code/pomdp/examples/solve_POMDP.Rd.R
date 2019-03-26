library(pomdp)


### Name: solve_POMDP
### Title: Solve a POMDP Problem
### Aliases: solve_POMDP solve_POMDP_parameter

### ** Examples

data("TigerProblem")

tiger_solved <- solve_POMDP(model = TigerProblem, parameter = list(fg_points = 10))
tiger_solved

## look at the model
model(tiger_solved)

## look at the solution
solution(tiger_solved)

## plot the policy graph
plot(tiger_solved)

## display solver options
solve_POMDP_parameter()



