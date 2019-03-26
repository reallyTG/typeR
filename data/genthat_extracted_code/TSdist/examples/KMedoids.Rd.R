library(TSdist)


### Name: KMedoids
### Title: K medoids clustering for a time series database using the
###   selected distance measure.
### Aliases: KMedoids

### ** Examples


# The example.database3 synthetic database is loaded
data(example.database3)
tsdata <- example.database3[[1]]
groundt <- example.database3[[2]]

# Apply K-medoids clusterning for different distance measures

KMedoids(data=tsdata, ground.truth=groundt, k=5, "euclidean")
KMedoids(data=tsdata, ground.truth=groundt, k=5, "cid")
KMedoids(data=tsdata, ground.truth=groundt, k=5, "pdc")





