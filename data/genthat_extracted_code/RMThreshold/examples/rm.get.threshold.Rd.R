library(RMThreshold)


### Name: rm.get.threshold
### Title: Estimate an objective threshold for signal-noise separation in
###   random matrices
### Aliases: rm.get.threshold
### Keywords: models Random Matrix Theory Correlation matrix Signal noise
###   separation

### ** Examples


## Run with pre-defined random matrix:
set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
dim(random.matrix)		# 1000 1000

## Not run: 
##D res <- rm.get.threshold(random.matrix)	# threshold might be 3.21
##D str(res)								# List of 26
##D rm.show.plots(res$comparison.plots)  	# watch sequence of plots once more
## End(Not run)

## Try other parameters:
## Not run: 
##D res <- rm.get.threshold(random.matrix, unfold.method = "spline")	
##D res <- rm.get.threshold(random.matrix, dist.method = "KLD")			
##D res <- rm.get.threshold(random.matrix, discard.outliers = FALSE) # might cause problems
##D res <- rm.get.threshold(random.matrix, wait.seconds = 2)	 	 # slow down
##D res <- rm.get.threshold(random.matrix, discard.zeros = TRUE)    	
##D res <- rm.get.threshold(random.matrix, discard.zeros = TRUE, dist.method = "KLD")	
## End(Not run)

## Refine analysis by choosing narrower threshold range 
## Not run: 
##D res <- rm.get.threshold(random.matrix, interval = c(2.5, 3.5))		
## End(Not run)

## Apply the identified threshold to the matrix
cleaned.matrix <- rm.denoise.mat(random.matrix, threshold = 3.21)	
cleaned.matrix <- rm.discard.zeros(cleaned.matrix)	 					  
dim(cleaned.matrix)	# smaller

## Find the clusters in the thresholded matrix:
## Not run: 
##D   library(igraph)
##D   g  <- graph.adjacency(cleaned.matrix, mode = "undirected")
##D   clusters(g)		
## End(Not run)


## Not run: 
##D 
##D   ## Create modular matrix and validate:
##D   matlist = list()
##D   for (i in 1:4) matlist[[i]] = get.adjacency(erdos.renyi.game(250, 0.1))	
##D   mat <- bdiag(matlist)					# create block-diagonal matrix 		 
##D   rm.matrix.validation(as.matrix(mat))	# Exponential case, modular matrix
##D   
##D   ## Add noise:
##D   mat1 = add.Gaussian.noise(as.matrix(mat), mean = 0, stddev = 0.1)
##D   
##D   ## Find threshold, denoise, reconstruct the modules:
##D   res <- rm.get.threshold(mat1)	# threshold possibly about 0.46
##D   # a smaller interval had been ok as well:
##D   res <- rm.get.threshold(mat1, interval = c(0, 0.8)) 
##D   cleaned <- rm.denoise.mat(mat1, 0.5)
##D   matr <- cleaned != 0
##D   g  <- graph.adjacency(matr, mode = "undirected")
##D   clusters(g)	# 4 clusters reconstructed
##D   
## End(Not run)					  




