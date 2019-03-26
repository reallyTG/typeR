library(whiboclustering)


### Name: predict.whibo_cluster
### Title: Predict to which Cluster new data belongs
### Aliases: predict.whibo_cluster

### ** Examples

data <- iris[1:100, 1:4] #Numerical data only and first 100 rows

model <- whibo_clustering(data = data, k = 3)
predict(object = model, data = iris[101:150, 1:4])




