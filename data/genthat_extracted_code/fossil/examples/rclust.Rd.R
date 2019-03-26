library(fossil)


### Name: rclust
### Title: Relational Clustering
### Aliases: rclust
### Keywords: data

### ** Examples

#a null solution for the fdata example data set
data(fdata.mat)
fd.dist <- dino.dist(fdata.mat)
rclust(fd.dist, clusters = 2, runs = 10)



