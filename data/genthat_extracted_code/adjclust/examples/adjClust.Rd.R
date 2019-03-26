library(adjclust)


### Name: adjClust
### Title: Adjacency-constrained Clustering
### Aliases: adjClust

### ** Examples

sim <- matrix(
c(1.0, 0.1, 0.2, 0.3,
  0.1, 1.0 ,0.4 ,0.5,
  0.2, 0.4, 1.0, 0.6, 
  0.3, 0.5, 0.6, 1.0), nrow = 4)

## similarity, full width
fit1 <- adjClust(sim, "similarity")
plot(fit1)

## similarity, h < p-1
fit2 <- adjClust(sim, "similarity", h = 2)
plot(fit2)

## dissimilarity
dist <- as.dist(sqrt(2-(2*sim)))

## dissimilarity, full width
fit3 <- adjClust(dist, "dissimilarity")
plot(fit3)

## dissimilarity, h < p-1
fit4 <- adjClust(dist, "dissimilarity", h = 2)
plot(fit4)




