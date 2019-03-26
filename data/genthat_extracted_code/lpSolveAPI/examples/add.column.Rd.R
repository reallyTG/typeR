library(lpSolveAPI)


### Name: add.column
### Title: Add Column
### Aliases: add.column
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 0)
add.column(lps.model, c(6,2,4,9))
add.column(lps.model, c(3,1,5), indices = c(1,2,4))



