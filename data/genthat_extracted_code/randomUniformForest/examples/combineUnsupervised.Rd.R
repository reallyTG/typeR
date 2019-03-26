library(randomUniformForest)


### Name: combineUnsupervised
### Title: Combine Unsupervised Learning objects
### Aliases: combineUnsupervised
### Keywords: unsupervised learning clustering dimension reduction

### ** Examples

## not run
## Wine Quality Data Set
## http://archive.ics.uci.edu/ml/datasets/Wine+Quality

# data(wineQualityRed)
# X = wineQualityRed[, -ncol(wineQualityRed)]

## 1 - run unsupervised analysis on the first half of dataset 

# subset.1 = 1:floor(nrow(X)/2)
# wineQualityRed.model.1 = unsupervised.randomUniformForest(X, subset = subset.1, depth = 5) 

## assess roughly the model and visualize
#  wineQualityRed.model.1

# plot(wineQualityRed.model.1)

## 2 - run unsupervised analysis on the second half of dataset
# wineQualityRed.model.2 = unsupervised.randomUniformForest(X, subset = -subset.1, depth = 5)


## 2.1 if less clusters (than in 1) are got, split the one with the highest number of cases
## it is the second cluster in our case
# wineQualityRed.model.2 = splitClusters(wineQualityRed.model.2, 2)

## roughly assess and, eventually, merge and split again (with different seeds) in order 
## to be confident about the new clustering
# wineQualityRed.model.2

## 3 - combine
# wineQualityRed.combinedModel = 
# combineUnsupervised(wineQualityRed.model.1, wineQualityRed.model.2)

## visualize and plot
# wineQualityRed.combinedModel
# plot(wineQualityRed.combinedModel)

## compare with the full data and same modelling
# wineQualityRed.model = unsupervised.randomUniformForest(X, depth = 5)

## or increase depth (more computation and default option) for a more detailed model
# wineQualityRed.model = unsupervised.randomUniformForest(X)



