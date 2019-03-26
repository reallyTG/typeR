library(ockc)


### Name: bootockc
### Title: Bootstrap Order Constrained k-means Clustering
### Aliases: bootockc
### Keywords: cluster

### ** Examples

x <- rbind(cbind(rnorm(10, mean=0), rnorm(10, mean=0,), rnorm(10, mean=0)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=10), rnorm(10, mean=0)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=0), rnorm(10, mean=10)),
           cbind(rnorm(10, mean=10), rnorm(10, mean=10), rnorm(10, mean=10))
           )

bockc <- bootockc(x, 2:4, nboot=4, order=c(1:10, 21:40, 11:20),
                  multicore=FALSE, verbose=FALSE)
bockc



