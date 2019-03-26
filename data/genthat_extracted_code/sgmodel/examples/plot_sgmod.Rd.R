library(sgmodel)


### Name: plot_sgmod
### Title: plot_sgmod
### Aliases: plot_sgmod

### ** Examples

model <- sgmodel( grid = 100, rho = 0.2, sigma = 0.02)
plot_sgmod(model)
grid <- 200
utiltype <- "CRRA"
utilparam <- 4
A <- 1
depre <- 0.03
discount <- 0.95
prod <- 0.3
states <- 5
m <- 2
rho <- 0.2
sigma <- 0.02
model <- sgmodel(grid, utiltype, utilparam, A, depre, discount, prod, states, m, rho, sigma)
plot_sgmod(model)



