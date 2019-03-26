library(randomUniformForest)


### Name: partialDependenceOverResponses
### Title: Partial Dependence Plots and Models
### Aliases: partialDependenceOverResponses

### ** Examples

## not run
## NOTE:  please remove comments to run
#### Classification: "car evaluation" data (http://archive.ics.uci.edu/ml/datasets/Car+Evaluation)
# data(carEvaluation)
# car.data <- carEvaluation

# n <- nrow(car.data)
# p <- ncol(car.data)

# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## train examples
# car.data.train <- car.data[trainTestIdx == 1, -p]
# car.class.train <- as.factor(car.data[trainTestIdx == 1, p])

## test data
# car.data.test <- car.data[trainTestIdx == 2, -p]
# car.class.test <- as.factor(car.data[trainTestIdx == 2, p])

## compute model : train then test in the same function
# car.ruf <- randomUniformForest(car.data.train, car.class.train, 
# xtest = car.data.test, ytest = car.class.test, threads = 2)
# car.ruf

## compute importance
# car.ruf.importance <- importance.randomUniformForest(car.ruf, 
# Xtest = car.data.train, threads = 2)

## plot partial dependence, at all orders, between classes and 'safety' feature on train data.
## Note that data are mainly categorical, ordinal and characters (e.g. v-high, high, med, low 
## for 'safety'). Model deals internally with characters and compute them as numerical values 
## (e.g.  "v-high, high, med, low" leads to 4,1,3,2.)

## how safety affects labels, knowing all others features ?
# pD.car.safety <- partialDependenceOverResponses(car.data.train, car.ruf.importance, 
# whichFeature = "safety", whichOrder = "all")

## What's happen at first order ?
# pD.1rstOrder.car.safety <- partialDependenceOverResponses(car.data.train, car.ruf.importance,
# whichFeature = "safety", whichOrder = "first")

## plot partial dependence, at first order, default, 
## between classes and 'buying' feature on train data
# pD.1rstOrder.car.buying <- partialDependenceOverResponses(car.data.train, car.ruf.importance, 
# whichFeature = "buying")

## plot partial dependence, at second order, between classes and 'buying' feature on train data.
## Second order means 'buying' feature is supposed to be the second most important feature
## and first one is unknown.
# pD.2ndOrder.car.buying <- partialDependenceOverResponses(car.data.train, car.ruf.importance, 
# whichFeature = "buying", whichOrder = "second")

## if one wants to assess test set, e.g. test responses are unkown
# car.ruf <- randomUniformForest(car.data.train, car.class.train, 
# xtest = car.data.test, threads = 2)
# car.ruf

## compute importance object deeper (increasing level of interactions) and on test data
# car.ruf.importance <- importance.randomUniformForest(car.ruf, Xtest = car.data.test, 
# maxInteractions = 6, threads = 2)

# pD.1rstOrder.car.safety <- partialDependenceOverResponses(car.data.test, car.ruf.importance, 
# whichFeature = "safety")

# pD.2ndOrder.car.buying <- partialDependenceOverResponses(car.data.test, car.ruf.importance, 
# whichFeature = "buying", whichOrder = "second")

# pD.allOrders.car.priceOfMaintenance <- partialDependenceOverResponses(car.data.test,
# car.ruf.importance, whichFeature = "priceOfMaintenance", whichOrder = "all")

# pD.2ndOrder.car.priceOfMaintenance <- partialDependenceOverResponses(car.data.test,
# car.ruf.importance, whichFeature = "priceOfMaintenance", whichOrder = "second")

#### Regression : "Concrete Compressive Strength" data 
## (http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength)

# data(ConcreteCompressiveStrength)
# ConcreteCompressiveStrength.data = ConcreteCompressiveStrength

# n <- nrow(ConcreteCompressiveStrength.data)
# p <- ncol(ConcreteCompressiveStrength.data)

# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## train examples
# Concrete.data.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, -p]
# Concrete.responses.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, p]

## model
# Concrete.ruf <- randomUniformForest(Concrete.data.train, Concrete.responses.train,
# featureselectionrule = "L1", threads = 2)
# Concrete.ruf

## importance object only for train examples
# Concrete.ruf.importance <- importance.randomUniformForest(Concrete.ruf,
# Xtest = Concrete.data.train, maxInteractions = 4, threads = 2)

## partial dependence only for train examples :
## at all orders
# pD.Concrete.Cement <- partialDependenceOverResponses(Concrete.data.train, 
# Concrete.ruf.importance, whichFeature = "Cement", whichOrder = "all")

# pD.Concrete.Age <- partialDependenceOverResponses(Concrete.data.train, 
# Concrete.ruf.importance, whichFeature = "Age", whichOrder = "all")

## at first order
# pD.1rstOrder.Concrete.Water <- partialDependenceOverResponses(Concrete.data.train, 
# Concrete.ruf.importance, whichFeature = "Water")



