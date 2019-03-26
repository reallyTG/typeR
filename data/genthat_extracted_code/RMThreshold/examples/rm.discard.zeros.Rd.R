library(RMThreshold)


### Name: rm.discard.zeros
### Title: Discard rows and columns from a matrix that exclusively contain
###   zero-valued off-diagonal matrix elements
### Aliases: rm.discard.zeros

### ** Examples


set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
dim(random.matrix)

## After identification of a proper threshold:
cleaned.matrix <- rm.denoise.mat(random.matrix, threshold = 3.2, keep.diag = TRUE)	
cl2.matrix = rm.discard.zeros(cleaned.matrix)				
 



