library(clogitboost)


### Name: summary.clogitboost
### Title: Summary after fitting a boosting conditional logit model
### Aliases: summary.clogitboost

### ** Examples

data(travel)
train <- 1:504
y <- travel$MODE[train]
x <- travel[train, 3:6]
strata <- travel$Group[train]
fit <- clogitboost(y = y, x = x, strata = strata, iter = 10, rho = 0.05)
summary(fit)



