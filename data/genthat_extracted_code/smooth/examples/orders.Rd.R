library(smooth)


### Name: orders
### Title: Functions that extract values from the fitted model
### Aliases: orders lags modelName modelType
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


x <- rnorm(100,0,1)

# Just as example. orders and lags do not return anything for ces() and es(). But modelType() does.
ourModel <- ces(x, h=10)
orders(ourModel)
lags(ourModel)
modelType(ourModel)
modelName(ourModel)

# And as another example it does the opposite for gum() and ssarima()
ourModel <- gum(x, h=10, orders=c(1,1), lags=c(1,4))
orders(ourModel)
lags(ourModel)
modelType(ourModel)
modelName(ourModel)

# Finally these values can be used for simulate functions or original functions.
ourModel <- auto.ssarima(x)
ssarima(x, orders=orders(ourModel), lags=lags(ourModel), constant=ourModel$constant)
sim.ssarima(orders=orders(ourModel), lags=lags(ourModel), constant=ourModel$constant)

ourModel <- es(x)
es(x, model=modelType(ourModel))
sim.es(model=modelType(ourModel))




