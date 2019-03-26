library(intrinsicDimension)


### Name: knnDimEst
### Title: Dimension Estimation from kNN Distances
### Aliases: knnDimEst

### ** Examples

N <- 50
data <- hyperBall(N, 5)

k <- 2
ps <- seq(max(k + 1, round(N/2)), N - 1, by = 3)
knnDimEst(data, k, ps, M = 10, gamma = 2)




