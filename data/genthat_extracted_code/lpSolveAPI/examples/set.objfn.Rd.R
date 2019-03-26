library(lpSolveAPI)


### Name: set.objfn
### Title: Set Objective Function
### Aliases: set.objfn
### Keywords: programming

### ** Examples

lps.model <- make.lp(2, 4)
set.objfn(lps.model, c(1,2,3,4))
set.objfn(lps.model, c(5,7,6), indices = c(1,2,4))



