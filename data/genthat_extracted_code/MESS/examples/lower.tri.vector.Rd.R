library(MESS)


### Name: lower.tri.vector
### Title: Split Matrix by Clusters and Return Lower Triangular Parts as
###   Vector
### Aliases: lower.tri.vector
### Keywords: manip

### ** Examples


m <- matrix(1:64, ncol=8)
cluster <- c(1, 1, 1, 1, 2, 2, 3, 3)
lower.tri.vector(m, cluster)




