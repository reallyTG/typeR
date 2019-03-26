library(lpSolveAPI)


### Name: set.row
### Title: Set Row
### Aliases: set.row
### Keywords: programming

### ** Examples

lps.model <- make.lp(2, 4)
set.row(lps.model, 2, c(6,2,4,9))
set.row(lps.model, 1, c(3,1,5), indices = c(1,2,4))



