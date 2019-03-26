library(analytics)


### Name: Minstress
### Title: Better Starting Configuration For Non-Metric MDS
### Aliases: Minstress

### ** Examples


require(MASS)

swiss.x <- as.data.frame(swiss[, -1])
Minstress(swiss.x, 1e5, 50, 2, iter = 3)

# Comparing without using Minstress (for such a low value of s, difference is minimal)
swiss.x <- as.matrix(swiss[, -1])
swiss.dist <- dist(swiss.x)
swiss.mds <- isoMDS(swiss.dist)




