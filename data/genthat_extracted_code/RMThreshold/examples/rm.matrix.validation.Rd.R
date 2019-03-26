library(RMThreshold)


### Name: rm.matrix.validation
### Title: Validate input matrix prior to threshold computation
### Aliases: rm.matrix.validation
### Keywords: models Random Matrix Theory Correlation matrix Mutual
###   information Signal noise separation

### ** Examples


## Run with self-created  random matrix:
set.seed(777)
random.matrix <- create.rand.mat(size = 1000, distrib = "norm")$rand.matr
dim(random.matrix)		# 1000 1000   should be big enough

## Not run: 
##D res <- rm.matrix.validation(random.matrix)
##D res <- rm.matrix.validation(random.matrix, discard.outliers = FALSE)	
##D res <- rm.matrix.validation(random.matrix, unfold.method = "spline")
##D res <- rm.matrix.validation(random.matrix, unfold.method = "spline", discard.outliers = FALSE)
## End(Not run)

## Not run: 
##D   library(igraph)
##D 
##D   ## Create noisy matrix and validate:
##D   g <- erdos.renyi.game(1000, 0.1)	
##D   adj = as.matrix(get.adjacency(g))
##D   rm.matrix.validation(adj)	# Wigner-Dyson case, unstructured matrix, noise
##D 
##D   ## Create modular (block-diagonal) matrix and validate:
##D   matlist = list()
##D   for (i in 1:4) matlist[[i]] = get.adjacency(erdos.renyi.game(250, 0.1))	
##D   mat <- bdiag(matlist)	# block-diagonal matrix 		 
##D   rm.matrix.validation(as.matrix(mat))	# Exponential case, modular matrix
##D 
## End(Not run)




