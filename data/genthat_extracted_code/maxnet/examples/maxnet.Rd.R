library(maxnet)


### Name: maxnet
### Title: Maxent over glmnet
### Aliases: maxnet predict.maxnet maxnet.formula
###   maxnet.default.regularization
### Keywords: Maxent glmnet

### ** Examples

library(maxnet)
data(bradypus)
p <- bradypus$presence
data <- bradypus[,-1]
mod <- maxnet(p, data)
plot(mod, type="cloglog")
mod <- maxnet(p, data, maxnet.formula(p, data, classes="lq"))
plot(mod, "tmp6190_ann")



