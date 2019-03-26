library(randomUniformForest)


### Name: randomUniformForest-package
### Title: Random Uniform Forests for Classification, Regression and
###   Unsupervised Learning
### Aliases: randomUniformForest-package

### ** Examples

## Presenting some of the core functions
## Not run

## 1 - Classification: iris data set (assess whole data)

## load data (included in R):
# data(iris)
# XY = iris
# p = ncol(XY)
# X = XY[,-p]
# Y = XY[,p]

## Train a model : using formula
# iris.ruf = randomUniformForest(Species ~., XY, threads = 1)

## or using matrix
## iris.ruf = randomUniformForest(X, as.factor(Y), threads = 1)

## Assess model : Out-of-bag (OOB) evaluation
# iris.ruf

## Variable Importance : base assessment
# summary(iris.ruf)

## Variable Importance : deeper assessment (explain the modelling)
# iris.importance = importance(iris.ruf, Xtest = X, maxInteractions = p - 1)

## Visualize : details of Variable Importance 
## (tile windows vertically, using the R menu, to see all plots)
# plot(iris.importance, Xtest = X)

## Analyse : get an interpretation of the model results
# iris.ruf.analysis = clusterAnalysis(iris.importance, X, components = 3, 
# clusteredObject = iris.ruf, OOB = TRUE)

## Dimension reduction, clustering and visualization : OOB evaluation
# iris.clust.ruf = clusteringObservations(iris.ruf, X, importanceObject = iris.importance)

## 2 - Regression: Boston Housing (assess a test set)

## load data :
# install.packages("mlbench") ##if not installed
# data(BostonHousing, package = "mlbench")

# XY = BostonHousing
# p = ncol(XY)
# X = XY[,-p]
# Y = XY[,p]

## get random training and test sets :
## reproducibility :
# set.seed(2015)

# train_test = init_values(X, Y, sample.size = 1/2)
# Xtrain = train_test$xtrain
# Ytrain = train_test$ytrain
# Xtest = train_test$xtest
# Ytest = train_test$ytest

## Train a model : 
# boston.ruf = randomUniformForest(Xtrain, Ytrain)

## Assess (quickly) the model : 
# boston.ruf
# plot(boston.ruf)
# summary(boston.ruf)

## Predict the test set :
# boston.pred.ruf = predict(boston.ruf, Xtest)

## or predict quantiles
# boston.predQunatile_97.5.ruf = predict(boston.ruf, Xtest, type = "quantile", 
# whichQuantile = 0.975)

## or prediction intervals
# boston.predConfInt_95.ruf = predict(boston.ruf, Xtest, type = "confInt", conf = 0.95)

## Assess predictions :
# statsModel = model.stats(boston.pred.ruf, Ytest, regression = TRUE)

## Avoiding overfitting : under the i.i.d. assumption, OOB error
## is expected to be an upper bound of MSE. Convergence is first needed.
## Convergence needs low correlation between trees residuals.

# boston.ruf

## The easy way; reduce correlation(decreasing 'mtry' value) + post-processing 
# bostonNew.ruf = randomUniformForest(Xtrain, Ytrain, mtry = 4)

## (predict and) Post-process :
# bostonNew.predAll.ruf = predict(bostonNew.ruf, Xtest, type = "all")

# bostonNew.postProcessPred.ruf = postProcessingVotes(bostonNew.ruf, 
# predObject = bostonNew.predAll.ruf)

## Assess new predictions :
# statsModel = model.stats(bostonNew.postProcessPred.ruf, Ytest, regression = TRUE)

## Convergence : grow more trees
# bostonNew.moreTrees.ruf = rUniformForest.grow(bostonNew.ruf, Xtrain, ntree = 100)



