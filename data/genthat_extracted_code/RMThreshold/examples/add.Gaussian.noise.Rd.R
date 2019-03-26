library(RMThreshold)


### Name: add.Gaussian.noise
### Title: Add Gaussian noise to a matrix
### Aliases: add.Gaussian.noise
### Keywords: models Gaussian noise Random Matrix Theory

### ** Examples


## Not run: 
##D N = 500
##D some.mat = matrix(rep(1, N*N), nrow = N)	
##D some.mat[1:3, 1:10]
##D res <- rm.matrix.validation(some.mat)		# not really a proper matrix for this approach.
## End(Not run)

## It can help to add Gaussian noise to an improper matrix
## Not run: 
##D noisy.matrix <- add.Gaussian.noise(some.mat, mean = 0, stddev = 1, symm = TRUE)
##D noisy.matrix[1:3, 1:10]
##D res <- rm.matrix.validation(noisy.matrix)	# better!
##D res <- rm.get.threshold(noisy.matrix)		# about 4.3	
## End(Not run)




