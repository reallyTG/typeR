library(fclust)


### Name: NEFRC
### Title: Non-Euclidean Fuzzy Relational Clustering
### Aliases: NEFRC
### Keywords: multivariate

### ** Examples

## Not run: 
##D require(cluster)
##D data("houseVotes")
##D X <- houseVotes[,-1]
##D D <- daisy(x = X, metric = "gower")
##D clust.NEFRC <- NEFRC(D = D, k = 2:6, m = 2, index = "SIL.F")
##D summary(clust.NEFRC)
##D plot(clust.NEFRC)
## End(Not run)



