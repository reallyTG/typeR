library(lpSolveAPI)


### Name: set.mat
### Title: Set Matrix Element
### Aliases: set.mat
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 2)
x <- c(6,2,4,9)
set.column(lps.model, 2, x)
y <- c(3,1,5)
ind <- c(1,2,4)
set.column(lps.model, 1, y, ind)
set.constr.type(lps.model, rep("<=", 4))

set.mat(lps.model, 3, 2, 4.5)



