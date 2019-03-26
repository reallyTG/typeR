library(rdist)


### Name: product_metric
### Title: Product metric
### Aliases: product_metric

### ** Examples

# generate data
df <- matrix(runif(200), ncol = 2)
# distance matrices
dist_mat <- pdist(df)
dist_1 <- pdist(df[, 1])
dist_2 <- pdist(df[, 2])
# product distance matrix
dist_prod <- product_metric(dist_1, dist_2)
# check equality
all.equal(dist_mat, dist_prod)



