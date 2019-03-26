library(sgmodel)


### Name: print.summary_sgmod
### Title: print.summary_sgmod
### Aliases: print.summary_sgmod

### ** Examples

grid <- 200
utiltype <- "CRRA"
utilparam <- 4
A <- 1
depre <- 0.03
discount <- 0.95
prod <- 0.3
states <- 3
m <- 4
rho <- 0.2
sigma <- 0.02
model <- sgmodel(grid, utiltype, utilparam, A, depre, discount, prod, states, m, rho, sigma)
summary_sgmod(model)



