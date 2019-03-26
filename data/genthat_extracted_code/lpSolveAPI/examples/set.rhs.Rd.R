library(lpSolveAPI)


### Name: set.rhs
### Title: Set Right-Hand-Side
### Aliases: set.rhs
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 2)
x <- c(6,2,4,9)
set.column(lps.model, 2, x)
y <- c(3,1,5)
ind <- c(1,2,4)
set.column(lps.model, 1, y, ind)

set.rhs(lps.model, c(10, 20, 40, 80))



