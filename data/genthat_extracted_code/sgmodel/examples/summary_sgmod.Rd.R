library(sgmodel)


### Name: summary_sgmod
### Title: summary_sgmod
### Aliases: summary_sgmod

### ** Examples

grid <- 200
utiltype <- "CRRA"
utilparam <- 4
A <- 1
depre <- 0.03
discount <- 0.95
prod <- 0.3
states <- 3
m <- 3
rho <- 0.2
sigma <- 0.02
model <- sgmodel(grid, utiltype, utilparam, A, depre, discount, prod, states, m, rho, sigma)
summary_sgmod(model)



