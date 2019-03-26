library(randomUniformForest)


### Name: clusterAnalysis
### Title: Cluster (or classes) analysis of importance objects.
### Aliases: clusterAnalysis

### ** Examples

## not run
## load iris data
# data(iris)

## A - Clustering
## run unsupervised modelling, removing labels and committing 4 clusters
# iris.rufUnsupervised = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2)

## as supervised
# iris.rufUnsup2sup = as.supervised(iris.rufUnsupervised, iris[,-5], mtry = 1, nodesize = 2)

## importance
# iris.ruf.importance = importance(iris.rufUnsup2sup, Xtest = iris[,-5], maxInteractions = 4)

## cluster analysis
# iris.ruf.clusterAnalysis = clusterAnalysis(iris.ruf.importance, iris[,-5], components = 3)

## or
# iris.ruf.clusterAnalysis = clusterAnalysis(iris.ruf.importance, iris[,-5], components = 3, 
# clusteredObject = iris.rufUnsupervised)

## B - Classification (using OOB evaluation)
# iris.ruf = randomUniformForest(Species ~., data = iris, mtry = 1, nodesize = 2, threads = 1)

## importance
# iris.ruf.importance = importance(iris.ruf, Xtest = iris[,-5], maxInteractions = 4)

## analysis
# iris.ruf.clusterAnalysis = clusterAnalysis(iris.ruf.importance, iris[,-5], components = 3, 
# OOB = TRUE, clusteredObject = iris.ruf)



