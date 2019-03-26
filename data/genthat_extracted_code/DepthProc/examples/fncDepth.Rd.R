library(DepthProc)


### Name: fncDepth
### Title: Basic function for functional depths
### Aliases: fncDepth fncDepth.matrix fncDepth.zoo

### ** Examples


x <- matrix(rnorm(60), ncol = 20)
fncDepth(x, method = "FM", dep1d = "Mahalanobis")
fncDepth(x, byrow = FALSE)

# zoo and xts
library(xts)
data(sample_matrix)
sample.xts <- as.xts(sample_matrix, descr = "my new xts object")
fncDepth(sample.xts)




