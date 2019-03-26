library(llama)


### Name: cluster
### Title: Cluster model
### Aliases: cluster
### Keywords: cluster

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)

res = cluster(clusterer=makeLearner("cluster.XMeans"), data=folds, pre=normalize)
# the total number of successes
sum(successes(folds, res))
# predictions on the entire data set
res$predictor(satsolvers$data[satsolvers$features])

# determine best by number of successes
res = cluster(clusterer=makeLearner("cluster.XMeans"), data=folds,
    bestBy="successes", pre=normalize)
sum(successes(folds, res))

# ensemble clustering
rese = cluster(clusterer=list(makeLearner("cluster.XMeans"),
    makeLearner("cluster.SimpleKMeans"), makeLearner("cluster.EM")),
    data=folds, pre=normalize)

# ensemble clustering with a classifier to combine predictions
rese = cluster(clusterer=list(makeLearner("cluster.XMeans"),
    makeLearner("cluster.SimpleKMeans"), makeLearner("cluster.EM"),
    .combine=makeLearner("classif.J48")), data=folds, pre=normalize)
}



