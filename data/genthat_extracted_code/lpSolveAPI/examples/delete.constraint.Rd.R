library(lpSolveAPI)


### Name: delete.constraint
### Title: Delete Constraint
### Aliases: delete.constraint
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 4)
set.objfn(lps.model, rep(1, 4))

xt <- c(6,2,4,9)
add.constraint(lps.model, xt, "<=", 50)

yt <- c(3,1,5)
ind <- c(1,2,4)
add.constraint(lps.model, yt, 2, 75, ind)

delete.constraint(lps.model, 1)



