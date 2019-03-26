library(clogitboost)


### Name: marginal
### Title: Marginal utility for clogitboost objects
### Aliases: marginal

### ** Examples

data(travel)
train <- 1:504
y <- travel$MODE[train]
x <- travel[train, 3:6]
strata <- travel$Group[train]
fit <- clogitboost(y = y, x = x, strata = strata, iter = 10, rho = 0.05)
marginal(fit, grid = seq(0, 10, by = 1), d = 1)



