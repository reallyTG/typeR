library(GFORCE)


### Name: gforce.kmeans
### Title: K-means Clustering.
### Aliases: gforce.kmeans

### ** Examples

m <- 10 
n <- 10
X <- matrix(MASS::mvrnorm(m*n,rep(0,m*n),diag(m*n)), nrow = n)
km_res <- gforce.kmeans(X,3)




