library(ppclust)


### Name: hcm
### Title: Hard C-Means Clustering
### Aliases: hcm
### Keywords: cluster

### ** Examples

# Load dataset iris 
data(iris)
x <- iris[,-5]

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x, k=3)$v

# Run HCM with the initial prototypes
res.hcm <- hcm(x, centers=v)

# Print, summarize and plot the clustering result
res.hcm$cluster
summary(res.hcm$cluster)
plot(x, col=res.hcm$cluster, pch=16)



