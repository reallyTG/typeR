library(MixAll)


### Name: clusterMixedData
### Title: Create an instance of the ['ClusterMixedDataModel'] class
### Aliases: clusterMixedData

### ** Examples

## A quantitative example with the heart disease data set
data(HeartDisease.cat)
data(HeartDisease.cont)
## with default values
ldata = list(HeartDisease.cat, HeartDisease.cont);
models = c("categorical_pk_pjk","gaussian_pk_sjk")
model <- clusterMixedData(ldata, models, nbCluster=2:5, strategy = clusterFastStrategy())

## get summary
summary(model)

## get estimated missing values
missingValues(model)

## Not run: 
##D ## print model
##D print(model)
##D ## use graphics functions
##D plot(model)
## End(Not run)




