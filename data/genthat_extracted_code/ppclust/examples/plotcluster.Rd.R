library(ppclust)


### Name: plotcluster
### Title: Plot Clustering Results
### Aliases: plotcluster
### Keywords: cluster

### ** Examples

# Run FCM for 3 clusters on the data set Iris
res.fcm <- fcm(x=iris[,-5], centers=3)

par(ask=TRUE)
# Plot the clustering results with solid colors
plotcluster(res.fcm, cp=1)

# Plot the same clustering results with transparent colors
plotcluster(res.fcm, cp=1, trans=TRUE)

# Plot the same clustering results for the memberships > 0.75
plotcluster(res.fcm, cp=1, cm="threshold", tv=0.75, trans=TRUE)
par(ask=FALSE)



