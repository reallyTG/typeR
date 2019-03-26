library(elasticnet)


### Name: predict.enet
### Title: Make predictions or extract coefficients from a fitted elastic
###   net model
### Aliases: predict.enet
### Keywords: regression methods

### ** Examples

data(diabetes)
attach(diabetes)
object <- enet(x,y,lambda=0.1)
### make predictions at the values in x, at each of the
### steps produced in object
fits <- predict.enet(object, x, type="fit")
### extract the coefficient vector with L1 norm=2000
coef2000 <- predict(object, s=2000, type="coef", mode="norm")
### extract the coefficient vector with L1 norm fraction=0.45
coef.45 <- predict(object, s=0.45, type="coef", mode="fraction")
detach(diabetes)



