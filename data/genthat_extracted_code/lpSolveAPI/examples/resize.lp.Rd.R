library(lpSolveAPI)


### Name: resize.lp
### Title: Resize LP
### Aliases: resize.lp
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 0)
resize.lp(lps.model, 4, 2)

x <- c(6,2,4,9)
add.column(lps.model, x)

y <- c(3,1,5)
ind <- c(1,2,4)
add.column(lps.model, y, ind)



