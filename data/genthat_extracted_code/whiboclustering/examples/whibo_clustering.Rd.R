library(whiboclustering)


### Name: whibo_clustering
### Title: Find Cluster model using White-Box Cluster Algorithm Design.
### Aliases: whibo_clustering

### ** Examples

data <- iris[, 1:4] #Take only numerical columns

#Perform k-means clustering
model <- whibo_clustering(data = data, k = 3)
model

#Perform some unorthodox clustering
model <- whibo_clustering(data = data, k = 3,
     normalization_type = 'Z', cluster_initialization_type = 'Ward',
     assignment_type = 'Correlation', recalculation_type = 'Trimean')




