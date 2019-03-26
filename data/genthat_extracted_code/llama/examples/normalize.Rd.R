library(llama)


### Name: normalize
### Title: Normalize features
### Aliases: normalize
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

cluster(clusterer=makeLearner("cluster.XMeans"), data=folds, pre=normalize)
}



