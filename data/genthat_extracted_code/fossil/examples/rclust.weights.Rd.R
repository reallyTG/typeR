library(fossil)


### Name: rclust.weights
### Title: Relational Clustering
### Aliases: rclust.weights
### Keywords: data

### ** Examples

data(fdata.mat)
fd.dist <- dino.dist(fdata.mat)
fd.clust <- rclust(fd.dist, 2)
rclust.weights(fd.clust, fd.dist)



