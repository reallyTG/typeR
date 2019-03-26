library(pomdp)


### Name: solution
### Title: Extract the Solution of a POMDP
### Aliases: solution

### ** Examples

data("TigerProblem")
tiger_solved <- solve_POMDP(model = TigerProblem)
tiger_solved

solution(tiger_solved)



