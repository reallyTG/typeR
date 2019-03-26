library(randomUniformForest)


### Name: randomUniformForest
### Title: Random Uniform Forests for Classification, Regression and
###   Unsupervised Learning
### Aliases: randomUniformForest randomUniformForest.default
###   randomUniformForest.formula plot.randomUniformForest
###   print.randomUniformForest summary.randomUniformForest

### ** Examples

## not run
## NOTE : use option 'threads = 1' (disabling parallel processing) to speed up computing 
## for small samples, since parallel processing is useful only for computationally 
## intensive tasks

###### PART ONE : QUICK GUIDE

#### Classification 

# data(iris)
# iris.ruf <- randomUniformForest(Species ~ ., data = iris, threads = 1)

## Regular companions (from 1 to 18):
## 1 -  model, parameters, statistics:
# iris.ruf ## or print(iris.ruf)

## 2 - OOB error: 
# plot(iris.ruf, threads = 1)

## 3 - (global) variable importance, some statistics about trees:
# summary(iris.ruf)

#### Regression

## NOTE: when formula is used, missing values are automatically deleted and dummies
## are built for categorical features

# data(airquality)
# ozone.ruf <- randomUniformForest(Ozone ~ ., data = airquality, threads = 1)
# ozone.ruf

## plot OOB error: 
# plot(ozone.ruf, threads = 1)

## 4 - Alternative modelling:
## 4.1 bagging like:
# ozone.bagging <- randomUniformForest(Ozone ~ ., data = airquality,
# bagging = TRUE, threads = 1)

## 4.2 Ensemble of totally randomized trees, e.g. purely random forest:
# ozone.prf <- randomUniformForest(Ozone ~ ., data = airquality, 
# randomfeature = TRUE, threads = 1)

## 4.3 Extremely randomized trees like:
# ozone.ETlike <- randomUniformForest(Ozone ~ ., data = airquality, 
# subsamplerate = 1, replace = FALSE, bagging = TRUE, mtry = floor((ncol(airquality)-1)/3),
# threads = 1)

## Common case: use X, as a matrix or data frame, and Y, as a response vector, 

#### Classification : iris data, training and testing

# data(iris)

## define random training and test sample :
## "Species" is the response vector

# set.seed(2015)
# iris.train_test <- init_values(iris[,-which(colnames(iris) == "Species")], iris$Species,
# sample.size = 1/2)

## training and test samples:
# iris.train = iris.train_test$xtrain
# species.train = iris.train_test$ytrain
# iris.test = iris.train_test$xtest
# species.test = iris.train_test$ytest

## 5 - training and test (or validation) modelling:
# iris.train_test.ruf <- randomUniformForest(iris.train, species.train,
# xtest = iris.test, ytest = species.test, threads = 1)

## 6 - all-in-one results:
# iris.train_test.ruf

## 7 - Alternative modelling: imbalanced classes
## balanced sampling (for example): equal sample size for all labels

# iris.train_test.balancedsampling.ruf <- randomUniformForest(iris.train, species.train,
# xtest = iris.test, ytest = species.test, rebalancedsampling = TRUE, threads = 1)
								
###### PART TWO : SUMMARIZED CASE STUDY

#### Classification : Wine Quality data
## http://archive.ics.uci.edu/ml/datasets/Wine+Quality
## We use 'red wine quality' file : data have 1599 observations, 12 variables and 6 classes.
 
# data(wineQualityRed)
# wineQualityRed.data = wineQualityRed

## class and observations
# Y = wineQualityRed.data[, "quality"]
# X = wineQualityRed.data[, -which(colnames(wineQualityRed.data) == "quality")]

## First look : train model with default parameters (and retrieve estimates)
# wineQualityRed.std.ruf <- randomUniformForest(X, as.factor(Y))
# wineQualityRed.std.ruf 

## (global) Variable Importance:
# summary(wineQualityRed.std.ruf)

## But some labels do not have enough observations to assess variable importance
## merging class 3 and 4. Merging class 7 and 8 to get enough labels.
# Y[Y == 3] = 4
# Y[Y == 8] = 7

## make Y as a factor, change names and get a summary
# Y = as.factor(Y)
# levels(Y) = c("3 or 4", "5", "6", "7 or 8")
# table(Y)

## learn a new model to get a better view on variable importance
## NOTE: Y is now a factor, the model will catch the learning task as a classification one
# wineQualityRed.new.ruf <- randomUniformForest(X, Y)
# wineQualityRed.new.ruf 

## global variable importance is more consistent
# summary(wineQualityRed.new.ruf)

## plot OOB error (needs some computing)
# plot(wineQualityRed.new.ruf)

## 8 - alternative Modelling: use subtrees (small trees, extended then reassembled)
## may change something, depending on data
# wineQualityRed.new.ruf <- randomUniformForest(X, Y, usesubtrees = TRUE)

## 9 - deep variable importance:
## 9.1 - interactions are granular: use more for consistency, or less to see primary information
## 9.2 - a table is printed with details
# importance.wineQualityRed <- importance(wineQualityRed.new.ruf, Xtest = X, maxInteractions = 6)
									
## 10 - visualization: 
## 10.1 - global importance, interactions, importance based on interactions, 
## importance based on labels, partial dependencies for all influential variables 
## (loop over the prompt to get others partial dependencies)
## 10.2 - get more points, using option whichOrder = "all", default option.

# plot(importance.wineQualityRed, Xtest = X, whichOrder = "first")

## 11 - Cluster analysis: (if quick answers are needed)
## Note: called 'cluster' since it was first designed for clustering
## 11.1 - choose the granularity : components, maximum features, (as) categorical ones
## 11.2 - get a compact view
## 11.3 - see how importance is explaining the data
# analysis.wineQualityRed = clusterAnalysis(importance.wineQualityRed, X, components = 3, 
# maxFeatures = 3, clusteredObject = wineQualityRed.new.ruf, categorical = NULL, OOB = TRUE)

## 11.4 - interpretation: 
## Numerical features average: a good wine has much less volatile acidity,
## much more citric acid, ... than a wine of low quality.
## Most influential features:  while volatile.acidity seems to be important,...
## (Component frequencies:) ..., all variables must be taken into account, since information
## provided by the most important ones does not enough cover the whole available information.

## 11.5 - Complementarity:
## One does not forget to look plot of importance function. clusterAnalysis( )
## is a summarized view of the former and should not have contradictory terms
## but, eventually, complementary ones.

## 12 - Partial importance: (local) variable importance per class
## which features for a very good wine (class 7 or 8) ?
## Note: in classification, partial importance is almost the same than "variable importance over
## labels", being more local but they have different interpretations. The former is exclusive.
# pImportance.wineQualityRed.class7or8 <- partialImportance(X, importance.wineQualityRed, 
# whichClass = "7 or 8", nLocalFeatures = 6)
											
## 13 - Partial dependencies: how response relies to each variable or a pair of ones?
## 13.1 - admit options.
## get it feature after feature, recalling partial dependence and considering feature 
## at the first order assuming the feature is the most important, 
## at least for the class one need to assess.

# pDependence.wineQualityRed.totalSulfurDioxide <- partialDependenceOverResponses(X, 
# importance.wineQualityRed, whichFeature = "total.sulfur.dioxide", 
# whichOrder = "first", outliersFilter = TRUE)

## 13.2 - Look for the second order (assuming the feature is the second most important, 
## at least for the class one need to assess).
# pDependence.wineQualityRed.totalSulfurDioxide <- partialDependenceOverResponses(X, 
# importance.wineQualityRed, whichFeature = "total.sulfur.dioxide", 
# whichOrder = "second", outliersFilter = TRUE)

## 13.3 - Look at all orders: no assumptions, simply look the average effect 
# pDependence.wineQualityRed.totalSulfurDioxide <- partialDependenceOverResponses(X, 
# importance.wineQualityRed, whichFeature = "total.sulfur.dioxide", 
# whichOrder = "all", outliersFilter = TRUE)
											
## see what happens then for "alcohol" (more points using option 'whichOrder = "all"')
# pDependence.wineQualityRed.alcohol <- partialDependenceOverResponses(X, 
# importance.wineQualityRed, whichFeature = "alcohol",  
# whichOrder = "first", outliersFilter = TRUE)

## 13.4 - Translate interactions into dependence : pair of features
## is interaction leading to the same class (underlying structure)?
## is dependence linear ? 
## for which values of the pair is the dependence the most effective ?
 
# pDependence.wineQualityRed.sulfatesAndVolatileAcidity <- partialDependenceBetweenPredictors(X, 
# importance.wineQualityRed, c("sulphates", "volatile.acidity"), 
# whichOrder = "all", outliersFilter = TRUE)

#### Regression : Auto MPG 
## http://archive.ics.uci.edu/ml/datasets/Auto+MPG
## 398 observations, 8 variables,
## Variable to predict : "mpg", miles per gallon 

# data(autoMPG)
# autoMPG.data = autoMPG

# Y = autoMPG.data[,"mpg"]
# X = autoMPG.data[,-which(colnames(autoMPG.data) == "mpg")]

## remove "car name" which is a variable with unique ID (car models)
# X = X[, -which(colnames(X) == "car name")]

## train the default model and get OOB evaluation
# autoMPG.ruf <- randomUniformForest(X, Y)

## assess variable importance (ask more points with 'maxInteractions' option)
## NOTE: importance strongly depends on 'ntree' and 'mtry' parameters
# importance.autoMPG <- importance(autoMPG.ruf, Xtest = X)

## 14 - Dependence on most important predictors: marginal distribution of the response
## over each variable
# plot(importance.autoMPG, Xtest = X)

## 15 - Extrapolation:
## recalling partial dependencies and getting points
## NOTE : points are the result of the forest classifier and not of the training responses
# pDependence.autoMPG.weight <- partialDependenceOverResponses(X, importance.autoMPG,
# whichFeature = "weight", whichOrder = "all", outliersFilter = TRUE)

## 16 - Visualization again: view as discrete values
# visualize again 'model year' as a discrete variable and not as a continuous one 
# pDependence.autoMPG.modelyear <- partialDependenceOverResponses(X, importance.autoMPG,
# whichFeature = "model year", whichOrder = "all", maxClasses = 30)

## 16 - Partial importance for regression: see important variables only for a part 
## of response values
## what are the features that lead to a lower consumption (and high mpg)?
# pImportance.autoMPG.high <- partialImportance(X, importance.autoMPG, 
# threshold = mean(Y), thresholdDirection = "high", nLocalFeatures = 6)
											
## 17 - Partial dependencies between covariates: 
## look at "weight" and "acceleration" dependence 
# pDependence.autoMPG.weightAndAcceleration <- 
# partialDependenceBetweenPredictors(X, importance.autoMPG, c("weight", "acceleration"),
# whichOrder = "all", perspective = FALSE, outliersFilter = TRUE)

## 18 - More visualization: 3D (looking to the prompt to start animation)
## Note: requires some computation
# pDependence.autoMPG.weightAndAcceleration <- 
# partialDependenceBetweenPredictors(X, importance.autoMPG, c("weight", "acceleration"),
# whichOrder = "all", perspective = TRUE, outliersFilter = FALSE)

##dtFW



