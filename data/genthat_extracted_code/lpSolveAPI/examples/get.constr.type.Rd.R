library(lpSolveAPI)


### Name: get.constr.type
### Title: Get Constraint Type
### Aliases: get.constr.type
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 3)

xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 15)

xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 15)

xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)

get.constr.type(lps.model)



