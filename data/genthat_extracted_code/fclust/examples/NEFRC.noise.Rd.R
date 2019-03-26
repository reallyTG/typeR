library(fclust)


### Name: NEFRC.noise
### Title: Non-Euclidean Fuzzy Relational Clustering with noise cluster
### Aliases: NEFRC.noise
### Keywords: multivariate

### ** Examples

## Not run: 
##D require(cluster)
##D data("houseVotes")
##D X <- houseVotes[,-1]
##D D <- daisy(x = X, metric = "gower")
##D clust.NEFRC.noise <- NEFRC.noise(D = D, k = 2:6, m = 2, index = "SIL.F")
##D summary(clust.NEFRC.noise)
##D plot(clust.NEFRC.noise)
## End(Not run)



