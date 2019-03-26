library(psych)


### Name: cluster2keys
### Title: Convert a cluster vector (from e.g., kmeans) to a keys matrix
###   suitable for scoring item clusters.
### Aliases: cluster2keys
### Keywords: multivariate

### ** Examples

test.data <- Harman74.cor$cov
kc <- kmeans(test.data,4)
keys <- cluster2keys(kc)
keys  #these match those found by ICLUST
cluster.cor(keys,test.data)



