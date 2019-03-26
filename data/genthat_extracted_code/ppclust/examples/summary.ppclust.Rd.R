library(ppclust)


### Name: summary.ppclust
### Title: Summarize the clustering results
### Aliases: summary.ppclust
### Keywords: cluster

### ** Examples

data(iris)
# Run FCM for three clusters
res.fcm <- fcm(x=iris[,1:4], centers=3)

# Summarize the result
summary(res.fcm)



