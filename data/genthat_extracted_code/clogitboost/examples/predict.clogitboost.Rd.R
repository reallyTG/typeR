library(clogitboost)


### Name: predict.clogitboost
### Title: Predicting after fitting a boosting conditional logit model
### Aliases: predict.clogitboost

### ** Examples

data(travel)
train <- 1:504
y <- travel$MODE[train]
x <- travel[train, 3:6]
strata <- travel$Group[train]
fit <- clogitboost(y = y, x = x, strata = strata, iter = 10, rho = 0.05)
predict(fit, x = travel[-train, 3:6], strata = travel$Group[-train])



