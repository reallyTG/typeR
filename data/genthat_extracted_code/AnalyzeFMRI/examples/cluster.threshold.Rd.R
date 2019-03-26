library(AnalyzeFMRI)


### Name: cluster.threshold
### Title: Cluster threshold an array.
### Aliases: cluster.threshold cluster_mass
### Keywords: utilities

### ** Examples


x <- array(0, dim = c(64, 64, 21))
x[10:20, 10:20, 1:5] <- 1
x[30:40, 30:40, 6:7] <- 1
x[50, 50, 8:9] <- 1

a <- cluster.threshold(x, size.thr = 400)
sum(x) ## should be 849
sum(a) ## should be 605




