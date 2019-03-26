library(randomUniformForest)


### Name: importance.randomUniformForest
### Title: Variable Importance for random Uniform Forests
### Aliases: importance.randomUniformForest importance plot.importance
###   print.importance

### ** Examples

## not run 
## 1 - Synthetic data:
## generate data

# set.seed(2014)
# n = 1000; p = 100 
# X = simulationData(n, p)
# X = fillVariablesNames(X)
# epsilon1 = runif(n,-1,1); epsilon2 = runif(n,-1,1)
# rule = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]
# Y = as.factor(ifelse(rule > mean(rule), "+","-"))

## X1, X2, X3, X4 are the most important ones since they generate the labels
## Other ones are noise.

## run model
# synth.model.ruf = randomUniformForest(X, as.factor(Y))

## a - summary of the model provides (by default) global variable importance 
## (most predictive and most discriminant ones (in the case of classification)
# summary(synth.model.ruf)

## b - get details of importance : local variable importance and partial dependencies
## we choose 'maxInteractions' between covariates to be equal to 2
# synth.importance.ruf = importance(synth.model.ruf, Xtest = X, maxInteractions = 2)

## show interactions, variable importance based on interactions and variable importance
## conditionally to each label
# synth.importance.ruf

## c - plot details : 
## - adds partial dependence, showing for which values of a variable, the class is changing,
## - displays interactions, showing how influential variables are covering all the possible
## interactions
## - displays variable importance based on interactions, showing their relative influence 
## - displays variable importance over labels, showing how each variable is influencing a class
## and how it is discriminant in the separation between two or more classes.

# plot(synth.importance.ruf, Xtest = X, nLocalFeatures = 6)

## d - complete analysis with other tools, for example clusterAnalysis() :
## synth.Analysis.ruf = clusterAnalysis(synth.importance.ruf, X, components = 3, 
## clusteredObject = synth.model.ruf, OOB = TRUE)

## or clusteringObservations() : table and plot
# synth.Analysis2.ruf = clusteringObservations(synth.model.ruf, X, OOB = TRUE,  
# importanceObject = synth.importance.ruf) 

## 2 - Importance for Classification and Regression (with formula)
####  Classification

# data(iris)
# iris.ruf <- randomUniformForest(Species ~ ., data = iris, threads = 1)

## global importance : 
# summary(iris.ruf)

# iris.ruf.importance <- importance(iris.ruf, Xtest = iris, threads = 1)

## get importance summary
# iris.ruf.importance

## visualizing all in one
# plot(iris.ruf.importance, Xtest = iris)

#### Regression

# data(airquality)
# airquality.data = airquality

## impute NA
# airquality.NAimputed <- fillNA2.randomUniformForest(airquality.data)

## compute model
# ozone.ruf <- randomUniformForest(Ozone ~ ., data = airquality.NAimputed, threads = 1)

# ozone.ruf
# summary(ozone.ruf)
# ozone.ruf.importance <- importance(ozone.ruf, Xtest = airquality.NAimputed, threads = 1)

## visualization: in case of formula, 'formulaInput' is needed for the 'plot' method
# plot(ozone.ruf.importance, Xtest = airquality.NAimputed, formulaInput = ozone.ruf$formula)

## 3 - Importance for Classification and Regression without formula (more usual and recommended) 

#### Classification: "car evaluation" data 
## (http://archive.ics.uci.edu/ml/datasets/Car+Evaluation)

# data(carEvaluation)
# car.data <- carEvaluation
# n <- nrow(car.data)
# p <- ncol(car.data)

# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## training examples
# car.data.train <- car.data[trainTestIdx == 1, -p]
# car.class.train <- as.factor(car.data[trainTestIdx == 1, p])

## test data
# car.data.test <- car.data[trainTestIdx == 2, -p]
# car.class.test <- as.factor(car.data[trainTestIdx == 2, p])

## compute model : train then test in the same function
## option 'categorical' may be used for categorical variables and should be consistent
## with Variable Importance but may lead to less accuracy.

# car.ruf <- randomUniformForest(car.data.train, car.class.train,
# xtest = car.data.test, ytest = car.class.test, categorical = "all")
# car.ruf

## global importance: note that 'safety' does not appear to be an important feature 
## in the barplot but in the table, it is the most important of unacceptable (unacc) cars.
# summary(car.ruf)

## interactions and local importance tell most of the story...
# car.ruf.importance <- importance(car.ruf, Xtest = car.data.train, threads = 1)

## ...that can be used to explain train data
# plot(car.ruf.importance, Xtest = car.data.train)

## or explain test data
# car.ruf.importance.test <- importance(car.ruf, Xtest = car.data.test, threads = 1)
# plot(car.ruf.importance.test, Xtest = car.data.test)

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

## test data
# Concrete.data.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, -p]
# Concrete.responses.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, p]

## model
# Concrete.ruf <- randomUniformForest(Concrete.data.train, Concrete.responses.train,
# featureselectionrule = "L1", threads = 1)
# Concrete.ruf

## predictions : option ' type = "all" ' is needed to manually assess importance of a test set 
# Concrete.ruf.pred <- predict(Concrete.ruf, Concrete.data.test, type = "all")

## more interactions
# Concrete.ruf.importance <- importance(Concrete.ruf, Xtest = Concrete.data.test,
# maxInteractions = 6, predObject = Concrete.ruf.pred, threads = 1)

## or more features to plot
# plot(Concrete.ruf.importance, nLocalFeatures = 7, Xtest = Concrete.data.test)



