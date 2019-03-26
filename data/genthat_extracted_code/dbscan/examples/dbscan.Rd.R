library(dbscan)


### Name: dbscan
### Title: DBSCAN
### Aliases: dbscan DBSCAN predict.dbscan_fast
### Keywords: model clustering

### ** Examples

data(iris)
iris <- as.matrix(iris[,1:4])

## find suitable eps parameter using a k-NN plot for k = dim + 1
## Look for the knee!
kNNdistplot(iris, k = 5)
abline(h=.5, col = "red", lty=2)

res <- dbscan(iris, eps = .5, minPts = 5)
res

pairs(iris, col = res$cluster + 1L)

## use precomputed frNN
fr <- frNN(iris, eps = .5)
dbscan(fr, minPts = 5)

## example data from fpc
set.seed(665544)
n <- 100
x <- cbind(
  x = runif(10, 0, 10) + rnorm(n, sd = 0.2),
  y = runif(10, 0, 10) + rnorm(n, sd = 0.2)
  )

res <- dbscan(x, eps = .3, minPts = 3)
res

## plot clusters and add noise (cluster 0) as crosses.
plot(x, col=res$cluster)
points(x[res$cluster==0,], pch = 3, col = "grey")

hullplot(x, res)

## predict cluster membership for new data points
## (Note: 0 means it is predicted as noise)
newdata <- x[1:5,] + rnorm(10, 0, .2)
predict(res, newdata, data = x)

## compare speed against fpc version (if microbenchmark is installed)
## Note: we use dbscan::dbscan to make sure that we do now run the
## implementation in fpc.
## Not run: 
##D if (requireNamespace("fpc", quietly = TRUE) &&
##D     requireNamespace("microbenchmark", quietly = TRUE)) {
##D   t_dbscan <- microbenchmark::microbenchmark(
##D     dbscan::dbscan(x, .3, 3), times = 10, unit = "ms")
##D   t_dbscan_linear <- microbenchmark::microbenchmark(
##D     dbscan::dbscan(x, .3, 3, search = "linear"), times = 10, unit = "ms")
##D   t_dbscan_dist <- microbenchmark::microbenchmark(
##D     dbscan::dbscan(x, .3, 3, search = "dist"), times = 10, unit = "ms")
##D   t_fpc <- microbenchmark::microbenchmark(
##D     fpc::dbscan(x, .3, 3), times = 10, unit = "ms")
##D 
##D   r <- rbind(t_fpc, t_dbscan_dist, t_dbscan_linear, t_dbscan)
##D   r
##D 
##D   boxplot(r,
##D     names = c('fpc', 'dbscan (dist)', 'dbscan (linear)', 'dbscan (kdtree)'),
##D     main = "Runtime comparison in ms")
##D 
##D   ## speedup of the kd-tree-based version compared to the fpc implementation
##D   median(t_fpc$time) / median(t_dbscan$time)
##D }
## End(Not run)



