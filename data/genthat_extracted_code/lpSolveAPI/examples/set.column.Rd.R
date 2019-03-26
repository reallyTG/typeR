library(lpSolveAPI)


### Name: set.column
### Title: Set Column
### Aliases: set.column
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 2)
set.column(lps.model, 2, c(6,2,4,9))
set.column(lps.model, 1, c(3,1,5), indices = c(1,2,4))



