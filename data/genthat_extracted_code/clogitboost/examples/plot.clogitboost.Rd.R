library(clogitboost)


### Name: plot.clogitboost
### Title: Plotting after fitting a boosting conditional logit model
### Aliases: plot.clogitboost

### ** Examples

data(travel)
train <- 1:504
y <- travel$MODE[train]
x <- travel[train, 3:6]
strata <- travel$Group[train]
fit <- clogitboost(y = y, x = x, strata = strata, iter = 10, rho = 0.05)
plot(fit, d = 1, xlab = "x", ylab = "f(x)", main = "TTIME", type = "l")




