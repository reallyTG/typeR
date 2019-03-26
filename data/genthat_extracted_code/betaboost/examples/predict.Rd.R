library(betaboost)


### Name: predict.betaboost
### Title: Predictions for betaboost models
### Aliases: predict predict.betaboost
### Keywords: methods

### ** Examples


## load data
data(QoLdata)

## define test data
test  <- QoLdata[1:10,]
train <- QoLdata[11:nrow(QoLdata),]

## fit model on training data
b1 <- betaboost(formula = QoL ~ arm + pain, data = train, 
                iterations = 500)

## predict on test data
predict(b1, newdata = test, type = "response")

## nuissance parameter phi
nuisance(b1)

## the same, but modelling also phi 
b2 <- betaboost(formula = QoL ~ arm + pain, data = train, 
                iterations = 1000,
                phi.formula = QoL ~ arm + pain)

## now also estimates for phi
predict(b2, newdata = test, type = "response")




