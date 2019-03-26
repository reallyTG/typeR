library(randomUniformForest)


### Name: clusteringObservations
### Title: Cluster observations of a (supervised) randomUniformForest
###   object
### Aliases: clusteringObservations
### Keywords: unsupervised learning clustering dimension reduction

### ** Examples

## not run
## Vehicle dataset : 
# data(Vehicle, package = "mlbench")
# XY = Vehicle
# Y = XY[,"Class"]
# X = XY[, -ncol(XY)]

## 1- learn supervised model and visualize only true labels:
 
# vehicle.ruf = randomUniformForest(X, as.factor(Y), ntree = 200)

## compute, for more details, importance
# vehicle.importance = importance(vehicle.ruf, Xtest = X)

## clustering object  
## 'OOB = FALSE' ensures that OOB classifier will not be called
## One may note that class 'opel' and 'saab' are hard to separate
# vehicle.clusterObject = clusteringObservations(vehicle.ruf, X, OOB = FALSE,
# importanceObject = vehicle.importance, clusters = 4)

# vehicle.clusterObject 

## 2 - visualize the OOB point of view
# vehicle.clusterObjectOOB = clusteringObservations(vehicle.ruf, X, OOB = TRUE,
# importanceObject = vehicle.importance, clusters = 4)

## note that true labels are left to their numeric values in order to not modify
## the internal structure of the supervised model
#  vehicle.clusterObjectOOB

## 2.1 use 'sparseProximities = TRUE' (providing a better clustering)
# vehicle.clusterObjectOOB.2 = clusteringObservations(vehicle.ruf, X, OOB = TRUE,
# importanceObject = vehicle.importance, clusters = 4, sparseProximities  = TRUE)

# vehicle.clusterObjectOOB.2

## 3 - learn supervised model, predict and visualize predictions
## set training and test sets

# set.seed(2014)
# train_test = init_values(X, Y, sample.size = 1/2)
# X1 = train_test$xtrain
# Y1 = train_test$ytrain
# X2 = train_test$xtest
# Y2 = train_test$ytest

## learn and predict
# vehicle.new.ruf = randomUniformForest(X1, as.factor(Y1), xtest = X2, ntree = 200)

## compute importance for the test set
# vehicle.new.importance = importance(vehicle.new.ruf, Xtest = X2)

## clustering predictions : no satisfaction. 
## Clustering seems to the reside in a higher dimension
# vehicle.new.clusterObject = clusteringObservations(vehicle.new.ruf, X2, 
# importanceObject = vehicle.new.importance, OOB = FALSE, clusters = 4, sparsePrxoimities = TRUE)

## 3.1 - ask help : let's kMeans talk, i.e. can the problem have a dimension as small as 2 ?
## note that the clustering process generates its own predictions and the labels of clusters 
## generated have, usually, no direct links with the true labels. 
## More precisely cluster 1 is usually not label 1 of the supervised case.
## For the same reasons, importanceObject must be computed in another manner

# vehicle.more.clusterObject = clusteringObservations(vehicle.new.ruf, X2, 
# endModel = "MDSkMeans", clusters = 4, OOB = FALSE)

## 3.2 - Clustering is achieved, but what is the cost for the predictions ?
## compare with true test labels : first let's look to the supervised model

# stats.new = model.stats(as.factor(vehicle.new.ruf$predictionObject$majority.vote), 
# as.factor(Y2))

## for the clustering model, pairing true test labels and cluster labels
## is done as a shortcut. Finally, even if clustering is achievable
## it does not necessarily correspond to the true labels.

# clusterPredictions = mergeOutliers(vehicle.more.clusterObject)

# 'bus'
# table(clusterPredictions[which(as.numeric(Y2) == 1)])
# hence 'bus' corresponds to the cluster 4 (most frequent values)

# 'opel'
# table(clusterPredictions[which(as.numeric(Y2) == 2)])
# hence 'opel' corresponds to the cluster 3 (most frequent values)

# 'saab'
# table(clusterPredictions[which(as.numeric(Y2) == 3)])
# hence 'saab' corresponds to the cluster 3 (most frequent values)
# or 1, since the former is already taken. We can see that
# the clustering is still having troubles to separate 'saab' and 'opel'
# since both could reside in the same cluster (3).

# 'van'
# table(clusterPredictions[which(as.numeric(Y2) == 4)])
# hence 'van' corresponds to the cluster 2 (most frequent values)

## 3.2 - ask spectral clustering
# vehicle.more.clusterObject = clusteringObservations(vehicle.new.ruf, X2, 
# endModel = "SpectralkMeans", clusters = 4, OOB = FALSE)
# clusterPredictions = mergeOutliers(vehicle.more.clusterObject)

## looks better, but finding true classes remains difficult
## one may use more dimensions : 'metricDimension' for the number to compute, 
## 'coordinates' for the dimensions to be clustered.
# vehicle.more.clusterObject = clusteringObservations(vehicle.new.ruf, X2, 
# endModel = "SpectralkMeans", clusters = 4, OOB = FALSE, metricDimension = 10, coordinates = 1:5)

## then plot pair of coordinates and choose the one that looks good and use it for a new modelling
# plot(vehicle.more.clusterObject, coordinates = c(1,2))
# plot(vehicle.more.clusterObject, coordinates = c(2,3))

## remove coordinates that are useless
# vehicle.more.clusterObject = rm.coordinates(vehicle.more.clusterObject, c(1,4,5))
# vehicle.more.clusterObject
# plot(vehicle.more.clusterObject)
# clusterPredictions = mergeOutliers(vehicle.more.clusterObject)

## new model should looks better in predicting Vehicle labels...



