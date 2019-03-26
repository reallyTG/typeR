library(lpSolveAPI)


### Name: get.variables
### Title: Get Variables
### Aliases: get.variables
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.objfn(lps.model, c(-3,-4,-3))

solve(lps.model)
get.variables(lps.model)



