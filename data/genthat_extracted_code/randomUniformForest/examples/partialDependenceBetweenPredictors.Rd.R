library(randomUniformForest)


### Name: partialDependenceBetweenPredictors
### Title: Partial Dependence between Predictors and effect over Response
### Aliases: partialDependenceBetweenPredictors

### ** Examples

## not run

#### Classification: "car evaluation" data 
## (http://archive.ics.uci.edu/ml/datasets/Car+Evaluation)
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

## compute model : train then test in the same function. 
## use 'categorical' option to better handle  variable importance
# car.ruf <- randomUniformForest(car.data.train, car.class.train, 
# xtest = car.data.test, ytest = car.class.test, categorical = "all")
# car.ruf

## get for example two most important features, using the table
## we choose "buying" and "safety"
# summary(car.ruf) 

## compute importance with deepest level of interactions to get enough points
# car.ruf.importance <- importance.randomUniformForest(car.ruf,
# Xtest = car.data.train, maxInteractions = 6)

## compute and plot partial dependence between "buying" and "safety" on train data
## is interaction leading to the same class (underlying structure)?
## is dependence linear or, for categorical variables, how is the effect of cross-tabulating 
## the variables over each class ? 
## for which values of the pair is the dependence most effective ?

# pDbetweenPredictors.car.buyingAndSafety <- partialDependenceBetweenPredictors(car.data.train,
# car.ruf.importance, c("buying", "safety"), whichOrder = "all") 

## Interpretation : 
## 1 - if "safety" is 'low', with average frequency of (around) 63 percent the 
## label of the evaluated car would be the same than the one coming from any buying category
## meaning that, the buying price will not have influence.
## If safety is 'high', the evaluated car will depend on the buying price...
## In the same sense, if the buying price is 'very high', the label of the evaluated car 
## will also depend to the safety category most of the time. 
## For a high (or lower) buying price, it will be much less dependent.
## But:
## 2 - the "heatmap..." states that confidence (more data) will be greater for cases 
## where buying price is very high (with safety low) or high (with safety high)
## 3 - Hence looking to the "dependence between predictors",  shows that if buying price is high, 
## it means that safety must be also high before one draws a conclusion.
## 4 - Looking "Variable Importance based on interactions" tells which variable dominates 
## the other when a car is evaluated.

#### Regression : "Concrete Compressive Strength" data 
## (http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength)

# data(ConcreteCompressiveStrength)
# ConcreteCompressiveStrength.data = ConcreteCompressiveStrength

# n <- nrow(ConcreteCompressiveStrength.data)
# p <- ncol(ConcreteCompressiveStrength.data)

# set.seed(2015)
# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## train examples
# concrete.data.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, -p]
# concrete.responses.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, p]

## test data
# concrete.data.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, -p]
# concrete.responses.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, p]

## model
# concrete.ruf <- randomUniformForest(concrete.data.train, concrete.responses.train,
# featureselectionrule = "L1")
# concrete.ruf

## Assessing test set only 
## importance at the deepest level of interactions
# concrete.ruf.importance <- importance.randomUniformForest(concrete.ruf,
# Xtest = concrete.data.test, maxInteractions = 8)

## compute and plot partial dependence between "Age" and "Cement", 
## without 3D representation and with filter upon outliers

# pDbetweenPredictors.concrete.cementAndAge <- 
# partialDependenceBetweenPredictors(concrete.data.test,
# concrete.ruf.importance, c("Age", "Cement"), whichOrder = "all", outliersFilter = TRUE)

## compute and plot partial dependence between "Age" and "Cement", 
## with 3D representation (slower)

# pDbetweenPredictors.concrete.cementAndAge <- 
# partialDependenceBetweenPredictors(concrete.data.test,
# concrete.ruf.importance, c("Age", "Cement"), whichOrder = "all", perspective = TRUE)



