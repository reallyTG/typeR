library(gtcorr)


### Name: gtcorr.matrix.user
### Title: Calculate the efficiency of matrix group testing procedures for
###   user specified arrangements
### Aliases: gtcorr.matrix.user

### ** Examples

##Calculate the efficiency of a 4 by 4 matrix procedure where the first
##two rows are in the first cluster, the bottom left 2 by 2 submatrix
##makes up the second cluster, and the bottom right 2 by 2 submatrix
##makes up the third cluster.
clusters <- matrix(NA, 4, 4)
clusters[1:2, ] <- 1
clusters[3:4, 1:2] <- 2
clusters[3:4, 3:4] <- 3
p <- .01
sigma <- .4
gtcorr.matrix.user(clusters, p, sigma)



