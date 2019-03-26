library(randomUniformForest)


### Name: generic.cv
### Title: Generic k-fold cross-validation
### Aliases: generic.cv

### ** Examples

## not run
# data(iris)
# Y <- iris$Species
# X <- iris[,-which(colnames(iris) == "Species")]

## 10-fold cross-validation for the randomUniformForest algorithm:

## create the wrapper function (setting 'threads = 1' since data are small)
# genericAlgo.ruf <- function(X, Y) randomUniformForest(X, Y, 
# OOB = FALSE, importance = FALSE, threads = 1)

## run
# rUF.10cv.iris <- generic.cv(X, as.factor(Y), 
# genericAlgo = genericAlgo.ruf, regression = FALSE)
  
## 10-fold cross-validation for the randomForest algorithm:

## create the wrapper function
# require(randomForest) || install.packages("randomForest")
# genericAlgo.rf <- function(X, Y) randomForest(X, Y)

## run
# RF.10cv.iris <- generic.cv(X, as.factor(Y), 
# genericAlgo = genericAlgo.rf, regression = FALSE)

## 10-fold cross-validation for Gradient Boosting Machines algorithm (gbm package)

## create the wrapper function
# require(gbm) || install.packages("gbm")
# genericAlgo.gbm <- function(X, Y) gbm.fit(X, Y, distribution = "multinomial",
# n.trees = 500, shrinkage = 0.05, interaction.depth = 24, n.minobsinnode = 1) 

## create a wrapper for the prediction function of gbm
# nClasses = length(unique(Y))
# specificPredictFunction.gbm <- function(model, newdata)
# {
#	modelPrediction = predict(model, newdata, 500) 
#	predictions = matrix(modelPrediction, ncol = nClasses )
#	colnames(predictions) = colnames(modelPrediction)
#	return(as.factor(apply(predictions, 1, function(Z) names(which.max(Z)))))
# }

## run
# gbm.10cv.iris <- generic.cv(X, Y, genericAlgo = genericAlgo.gbm, 
# specificPredictFunction = specificPredictFunction.gbm, regression = FALSE)

## 10-fold cross-validation for CART algorithm (rpart package):

# genericAlgo.CART <- function(X, Y) 
#{
#	ZZ = data.frame(Y, X)
#	if (is.factor(Y)) { modelObject = rpart(Y ~., data = ZZ, method = "class", ...)	}
#	else { 	modelObject = rpart(Y ~., data = ZZ, ...) }
#	return(modelObject) 
#}

# specificPredictFunction.CART <- function(model, newdata)
# predict(model, data.frame(newdata), type= "vector")

# CART.10cv.iris <- generic.cv(X, as.factor(Y), genericAlgo = genericAlgo.CART, 
# specificPredictFunction = specificPredictFunction.CART, regression = FALSE)




