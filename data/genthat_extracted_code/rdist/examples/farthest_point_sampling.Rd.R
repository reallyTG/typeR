library(rdist)


### Name: farthest_point_sampling
### Title: Farthest point sampling
### Aliases: farthest_point_sampling

### ** Examples


# generate data
df <- matrix(runif(200), ncol = 2)
dist_mat <- pdist(df)
# farthest point sampling
fps <- farthest_point_sampling(dist_mat)
fps2 <- farthest_point_sampling(df, metric = "euclidean")
all.equal(fps, fps2)
# have a look at the fps distance matrix
rdist(df[fps[1:5], ])
dist_mat[fps, fps][1:5, 1:5]



