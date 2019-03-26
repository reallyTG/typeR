library(RMThreshold)


### Name: rm.connections
### Title: Create ordered list of largest matrix elements
### Aliases: rm.connections
### Keywords: models

### ** Examples


set.seed(777)
random.mat <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
dim(random.mat)

## After identification of a proper threshold:
cleaned.matrix <- rm.denoise.mat(random.mat, threshold = 3.2, keep.diag = TRUE)	
cl2.matrix = rm.discard.zeros(cleaned.matrix)				 
df = rm.connections(cl2.matrix)  



