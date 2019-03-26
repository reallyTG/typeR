library(MASS)


### Name: rlm
### Title: Robust Fitting of Linear Models
### Aliases: rlm rlm.default rlm.formula print.rlm predict.rlm psi.bisquare
###   psi.hampel psi.huber
### Keywords: models robust

### ** Examples

summary(rlm(stack.loss ~ ., stackloss))
rlm(stack.loss ~ ., stackloss, psi = psi.hampel, init = "lts")
rlm(stack.loss ~ ., stackloss, psi = psi.bisquare)



