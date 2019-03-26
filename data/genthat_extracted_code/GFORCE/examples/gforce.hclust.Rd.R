library(GFORCE)


### Name: gforce.hclust
### Title: Hierarchical Clustering with Estimation of K.
### Aliases: gforce.hclust

### ** Examples

m <- 10 
n <- 10
X <- matrix(MASS::mvrnorm(m*n,rep(0,m*n),diag(m*n)), nrow = n)
hc_res <- gforce.hclust(X=X)




