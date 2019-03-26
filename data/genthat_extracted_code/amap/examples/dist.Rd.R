library(amap)


### Name: Dist
### Title: Distance Matrix Computation
### Aliases: Dist
### Keywords: multivariate cluster

### ** Examples

x <- matrix(rnorm(100), nrow=5)
Dist(x)
Dist(x, diag = TRUE)
Dist(x, upper = TRUE)


## compute dist with 8 threads
Dist(x,nbproc=8)


Dist(x,method="abscorrelation")
Dist(x,method="kendall")




