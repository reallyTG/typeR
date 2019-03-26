library(lpSolveAPI)


### Name: set.type
### Title: Set Type
### Aliases: set.type
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 3)
xt <- c(6,2,4)
add.constraint(lps.model, xt, "<=", 150)
xt <- c(1,1,6)
add.constraint(lps.model, xt, ">=", 0)
set.type(lps.model, 2, "binary")
xt <- c(4,5,4)
add.constraint(lps.model, xt, "=", 40)
set.type(lps.model, 3, "integer")
set.objfn(lps.model, c(-3,-4,-3))

get.type(lps.model)



