library(lpSolveAPI)


### Name: delete.column
### Title: Delete Column
### Aliases: delete.column
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 0)

x <- c(6,2,4,9)
add.column(lps.model, x)

y <- c(3,1,5)
ind <- c(1,2,4)
add.column(lps.model, y, ind)

delete.column(lps.model, 1)



