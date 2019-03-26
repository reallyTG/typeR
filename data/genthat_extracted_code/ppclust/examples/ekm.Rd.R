library(ppclust)


### Name: ekm
### Title: K-Means Clustering Using Different Seeding Techniques
### Aliases: ekm
### Keywords: cluster

### ** Examples

# Load dataset iris 
data(iris)
x <- iris[,-5]

# Run EKM for 3 clusters
res.ekm <- ekm(x, centers=3)

# Print and plot the clustering result
print(res.ekm$cluster)
plot(x, col=res.ekm$cluster, pch=16)



