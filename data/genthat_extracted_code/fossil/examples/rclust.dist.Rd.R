library(fossil)


### Name: rclust.dist
### Title: Relational Clustering
### Aliases: rclust.dist
### Keywords: data

### ** Examples

#a null solution for the fdata example data set
data(fdata.mat)
fd.dist <- dino.dist(fdata.mat)
fd.clust <- rclust(fd.dist, 2)
rclust.dist(fd.clust, fd.dist)



