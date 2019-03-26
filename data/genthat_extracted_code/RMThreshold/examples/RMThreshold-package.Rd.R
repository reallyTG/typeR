library(RMThreshold)


### Name: RMThreshold-package
### Title: Signal-Noise Separation in Correlation Matrices by using
###   Eigenvalue Spectrum Analysis
### Aliases: RMThreshold-package RMThreshold
### Keywords: models Random Matrix Theory

### ** Examples

## Not run: 
##D   set.seed(777)
##D   random.mat <- create.rand.mat(size = 1000, distrib = "norm")$rand.matrix
##D   res <- rm.matrix.validation(random.mat)	# ok
##D   res <- rm.get.threshold(random.mat)		# threshold about 3.19	 			
##D   rm.show.plots(res$comparison.plots) 							
##D   cleaned.matrix <- rm.denoise.mat(random.mat, threshold = 3.2)	
##D   cleaned.matrix <- rm.discard.zeros(cleaned.matrix)
## End(Not run)					



