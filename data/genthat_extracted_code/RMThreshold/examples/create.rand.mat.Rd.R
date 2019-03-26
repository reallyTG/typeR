library(RMThreshold)


### Name: create.rand.mat
### Title: Create a real-valued, symmetric random matrix
### Aliases: create.rand.mat
### Keywords: models Random matrix

### ** Examples

  set.seed(777)
  random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matrix
  dim(random.matrix)



