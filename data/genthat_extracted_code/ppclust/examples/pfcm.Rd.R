library(ppclust)


### Name: pfcm
### Title: Possibilistic Fuzzy C-Means Clustering Algorithm
### Aliases: pfcm
### Keywords: cluster

### ** Examples

# Load the dataset X12
data(x12)

# Set the initial centers of clusters
v0 <- matrix(nrow=2, ncol=2, c(-3.34, 1.67, 1.67, 0.00), byrow=FALSE)

# Run FCM with the initial centers in v0
res.fcm <- fcm(x12, centers=v0, m=2)

# Run PFCM with the final centers and memberhips from FCM
res.pfcm <- pfcm(x12, centers=res.fcm$v, memberships=res.fcm$u, m=2, eta=2)

# Show the typicality and fuzzy membership degrees from PFCM
res.pfcm$t
res.pfcm$u



