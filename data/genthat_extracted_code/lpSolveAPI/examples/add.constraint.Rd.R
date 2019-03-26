library(lpSolveAPI)


### Name: add.constraint
### Title: Add Constraint
### Aliases: add.constraint
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 4)
set.objfn(lps.model, rep(1, 4))
add.constraint(lps.model, c(6,2,4,9), "<=", 50)
add.constraint(lps.model, c(3,1,5), 2, 75, indices = c(1,2,4))



