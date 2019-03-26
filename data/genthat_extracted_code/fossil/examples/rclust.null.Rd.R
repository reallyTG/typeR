library(fossil)


### Name: rclust.null
### Title: Relational Clustering
### Aliases: rclust.null
### Keywords: data

### ** Examples

#a null solution for the fdata example data set
data(fdata.mat)
fd.dist <- dino.dist(fdata.mat)
fd.clust <- rclust(fd.dist, 2)
rclust.null(fd.clust, fd.dist)



