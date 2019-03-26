library(RMThreshold)


### Name: rm.denoise.mat
### Title: Remove noise from a random matrix by applying a threshold
### Aliases: rm.denoise.mat

### ** Examples


set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
dim(random.matrix)


## After identification of a proper candidate threshold:
cleaned.matrix <- rm.denoise.mat(random.matrix, threshold = 3.2, keep.diag = TRUE)	  
  



