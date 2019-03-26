library(ICEbox)


### Name: clusterICE
### Title: Clustering of ICE and d-ICE curves by kmeans.
### Aliases: clusterICE

### ** Examples

## Not run: 
##D require(ICEbox)
##D require(randomForest)
##D require(MASS) #has Boston Housing data, Pima
##D 
##D data(Boston) #Boston Housing data
##D X = Boston
##D y = X$medv
##D X$medv = NULL
##D 
##D ## build a RF:
##D bh_rf = randomForest(X, y)
##D 
##D ## Create an 'ice' object for the predictor "age":
##D bh.ice = ice(object = bh_rf, X = X, y = y, predictor = "age",
##D             frac_to_build = .1) 
##D 
##D ## cluster the curves into 2 groups.
##D clusterICE(bh.ice, nClusters = 2, plot_legend = TRUE)
##D 
##D ## cluster the curves into 3 groups, start all at 0.
##D clusterICE(bh.ice, nClusters = 3, plot_legend = TRUE, center = TRUE)
## End(Not run)



