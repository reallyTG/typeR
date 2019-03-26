library(lpSolveAPI)


### Name: set.bounds
### Title: Set Bounds
### Aliases: set.bounds
### Keywords: programming

### ** Examples

lps.model <- make.lp(0, 4)

set.bounds(lps.model, lower = rep(-1.0, 4))
set.bounds(lps.model, upper = 1:4)

set.bounds(lps.model, lower = rep(0.0, 4), upper = rep(1.0, 4))



