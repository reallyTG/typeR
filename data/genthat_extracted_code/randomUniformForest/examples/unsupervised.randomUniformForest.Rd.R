library(randomUniformForest)


### Name: unsupervised.randomUniformForest
### Title: Unsupervised Learning with Random Uniform Forests
### Aliases: unsupervised.randomUniformForest unsupervised
###   plot.unsupervised print.unsupervised

### ** Examples

## not run
#### A - Overview : the famous iris dataset

## load data
# data(iris)

## run unsupervised modelling, removing labels :
## Default options, letting the 'gap statistic' find the number of clusters.

## Note: the stochastic nature of the algorithm acts as an hidden parameter 
## whose one has to take care of.

## default (MDS) clustering
# iris.uruf = unsupervised.randomUniformForest(iris[,-5])

## for iris data, default option is not stable.
 
## Note: correlation between covariates play a key role on stability and clustering.
## Neutralize correlation requires to choose splitting variable at random.

## Increase 'nodesize' to get more stability
# iris.uruf2 = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2)

## would be better and stable (if repeated)

## Regular companions (from point 1 to point 14):
## 1 - Summary with raw assessment
# iris.uruf2

## 2 - Plot in the new space in 2D
# plot(iris.uruf2)

## 3 - Modify clusters (increasing or decreasing the number of clusters 
## and looking the variations of the silhouette coefficient).
## For example, if 4 clusters are found (since we know there are 3) :

# iris.uruf4Clusters = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2, 
# clusters = 4)
# iris.uruf3Clusters = modifyClusters(iris.uruf4Clusters, decreaseBy = 1)

## 4 - (or) Merge clusters if there are too many 
## merge the second and the third

## Note: one can play with modify/merge/split and 'plot' many times in order to improve
## the clustering
# iris.urufmerge = mergeClusters(iris.urufnsupervised4Clusters, c(1,2))  

## 5 - Alternatives : try Spectral clustering
## 'coordinates' specify which eigenvectors have to be sent to the clustering algorithm
## 'metricDimension' states for the maximal number of eigenvectors to use.
## Try 'coordinates = c(2,3)' and assess it by visualization

# iris.urufSpectral = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2, 
# endModel = "SpectralkMeans", metricDimension = 3, coordinates = c(2,3))

# plot(iris.urufSpectral)

## or try them all and choose/visualize the best representation
# iris.urufSpectral = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2, 
# endModel = "SpectralkMeans", metricDimension = 5, coordinates = c(1:5))

# plot(iris.urufSpectral, coordinates = c(1,2))
# plot(iris.urufSpectral, coordinates = c(2,3))
## ...

#### B - Full example with details
## Wholesale customers data (UCI machine learning repository)

# URL = "http://archive.ics.uci.edu/ml/machine-learning-databases/00292/"
# datasetName = "Wholesale%20customers%20data.csv"
# wholesaleCustomers = read.csv(paste(URL, datasetName, sep =""))

## modelling : three ways  
## - let the algorithm deal with all layers: categorical features, number of clusters,...
## - control the first layer to get stability (proximities matrix) and let the
## algorithm control the others.
## - control all manually.

## first way
# wholesaleCustomers.uruf.1 = unsupervised.randomUniformForest(wholesaleCustomers)

## assess quality of the clustering :
# wholesaleCustomers.uruf.1

## second way (we keep it) : use 'bagging' option to let each feature define a candidate node,
## use 'sparseProximities' that provides a better separation

## third way (seems the best) : spectral clustering, specifying clusters and changing seed
## to stabilize the clustering scheme when modelling is repeated.

# wholesaleCustomers.uruf.3 = unsupervised.randomUniformForest(wholesaleCustomers, 
# ntree = 500, sparseProximities = TRUE, endModel = "SpectralkMeans", bagging = TRUE, 
# categorical = c("Channel", "Region"), clusters = 3, seed = 2016)

## Speed up computation: less trees + increasing (minimal) node size + do not use logical cores
# wholesaleCustomers.uruf.3 = unsupervised.randomUniformForest(wholesaleCustomers, 
# ntree = 100, nodesize = 10, sparseProximities = TRUE, endModel = "SpectralkMeans", 
# bagging = TRUE, categorical = c("Channel", "Region"), clusters = 3, seed = 2016)

## Note: 'Channel' and 'Region' are categorical and differ from other products (consumer goods)
## At first, we keep all, seeking links between the context of consumption and the products.

# wholesaleCustomers.uruf.2 = unsupervised.randomUniformForest(wholesaleCustomers, 
# ntree = 500, sparseProximities = TRUE, bagging = TRUE, categorical = c("Channel", "Region"))

## Regular companions :
## 6 - Assess the randomUniformForest object (low OOB error is usually better but not a rule)
# wholesaleCustomers.uruf.2$rUF

## 7 - Look for influential variables (before clustering)
# summary(wholesaleCustomers.uruf.2$rUF)

## assess quality of the clustering and remove/add/merge clusters to see if things are better
# wholesaleCustomers.uruf.2
# plot(wholesaleCustomers.uruf.2)

## 8 - Get details : turning first the model into a supervised one
# wholesaleCustomers.ruf.2 = as.supervised(wholesaleCustomers.uruf.2, wholesaleCustomers, 
# ntree = 500, categorical = c("Channel", "Region"), BreimanBounds = FALSE)

## 9 - Assess the 'Learning clusters' process
# wholesaleCustomers.ruf.2

## 10 - Get variable importance : leading to a full analysis and visualization
# wholesaleCustomers.importance = importance(wholesaleCustomers.ruf.2, 
# Xtest = wholesaleCustomers, maxInteractions = 8)

## Visualize all: features, interactions, partial dependencies,...
## Note: tile window in the R menu to see all plots. Loop over the prompt to see
## all matched partial dependencies

# plot(wholesaleCustomers.importance, Xtest = wholesaleCustomers, whichOrder = "all")
## For details, type vignette("VariableImportanceInRandomUniformForests", 
## package = "randomUniformForest")
## Note : Variable importance strongly depends on the model and the chosen clusters

## 11 - more visualization: (another look on 'variable importance over labels')
## for each cluster, we can see which variables matter and their order.
# featuresCluster1 = partialImportance(wholesaleCustomers, 
# wholesaleCustomers.importance, whichClass = 1)
# ...

## 12 - Refining analysis : two possible levels, with and without Region (and Channel)

## 12.a - visualizing clusters and features: keeping Region and Channel
# plot(wholesaleCustomers.uruf.2, importanceObject = wholesaleCustomers.importance)

## 12.b - Removing Region and Channel to better assess others products:
## one may want to lead an analysis independent to the context

## If Region and/or Channel matter:
## - Solution 1: reach stability by first trying and repeating full random models, 
## leading to a new model (with variables of interest) and the former one. 
## - Solution 2: clustering with all features (as above), 
## assessment on variables of interest handled by the importance() function.
## - Solution 3: clustering with all features (as above), clusterAnalysis() function 
## is able to provide a granular view. We choose this solution.

## 13 - Cluster analysis: aggregated links between observations, features and clusters
## clusterAnalysis mainly shows what is happening when looking deeper in details

## 13.a - first, look inside clusters 
# wholesaleCustomersFinalSummary.ruf = clusterAnalysis(wholesaleCustomers.importance, 
# wholesaleCustomers, components = 3, maxFeatures = 4)

## 13.b - Numerical and categorical features aggregation
## same function, more options
## Note : here features are valuable, revenue for each. Hence one can exploit that.

# wholesaleCustomersFinalSummary.ruf = clusterAnalysis(wholesaleCustomers.importance, 
# wholesaleCustomers, components = 3, maxFeatures = 4, 
# clusteredObject = wholesaleCustomers.uruf.2, categorical = c("Channel", "Region"))

## 14 - Conciliate analysis
## clusterAnalysis( ) provides both influential features (leading to a better clustering)
## and valuable ones. Due to the purpose of the task, both types can be different
## but should give insights about the next task. 
## Suppose one wants to maximize revenues. Where could one put the efforts ?

## First, look to the global point of view (clusters) : 
# revenuePerCluster = 
# rowSums(wholesaleCustomersFinalSummary.ruf$numericalFeaturesAnalysis[,-c(1,2)])

## Then, look to the local point of view :
## for example, influential features in one cluster might be the ones that one need
## to develop in  another one... avoiding brute force techniques

## Notes:
## 1 - cluster analysis must be consistent with results of importance( ) function.
## If not, then something is going wrong in the modelling.
## 2 - To complete an analysis, one should take care of the whole process.
## For example, changing the clustering may change a lot the analysis.



