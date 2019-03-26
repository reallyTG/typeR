library(lsbclust)


### Name: KMeansW
### Title: C++ Function for Weighted K-Means
### Aliases: KMeansW ComputeMeans AssignCluster KMeansW

### ** Examples

set.seed(1)
clustmem <- sample.int(n = 10, size = 100, replace = TRUE)
mat <- rbind(matrix(rnorm(30*4, mean = 3), nrow = 30), 
             matrix(rnorm(30*4, mean = -2), nrow = 30), 
             matrix(rnorm(40*4, mean = 0), nrow = 40))
wt <- runif(100)
testMeans <- lsbclust:::ComputeMeans(cm = clustmem, data = mat, weight = wt, nclust = 3)
testK <- lsbclust:::KMeansW(start = clustmem, data = mat, weight = wt, nclust = 3)



