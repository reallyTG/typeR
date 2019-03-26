library(flexclust)


### Name: dist2
### Title: Compute Pairwise Distances Between Two Data sets
### Aliases: dist2
### Keywords: multivariate cluster

### ** Examples

x <- matrix(rnorm(20), ncol=4)
rownames(x) = paste("X", 1:nrow(x), sep=".")
y <- matrix(rnorm(12), ncol=4)
rownames(y) = paste("Y", 1:nrow(y), sep=".")

dist2(x, y)
dist2(x, y, "man")

data(milk)
dist2(milk[1:5,], milk[4:6,])



