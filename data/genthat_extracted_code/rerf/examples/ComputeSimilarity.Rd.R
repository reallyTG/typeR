library(rerf)


### Name: ComputeSimilarity
### Title: Compute Similarities
### Aliases: ComputeSimilarity

### ** Examples

library(rerf)
X <- as.matrix(iris[, 1:4])
Y <- iris[[5L]]
forest <- RerF(X, Y, num.cores = 1L)
sim.matrix <- ComputeSimilarity(X, forest, num.cores = 1L)



