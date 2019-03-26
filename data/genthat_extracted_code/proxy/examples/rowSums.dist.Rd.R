library(proxy)


### Name: rowSums.dist
### Title: Row Sums/Means of Sparse Symmetric Matrices
### Aliases: rowSums.dist colSums.dist rowMeans.dist colMeans.dist
### Keywords: cluster

### ** Examples

## 
x <- matrix(runif(10*2),ncol=2)
d <- dist(x)
rowSums(as.matrix(d))
rowSums.dist(d)			# the same

rowMeans(as.matrix(d))
rowMeans.dist(d)		# the same
rowMeans.dist(d, diag = FALSE)	# not the same
## NAs
d[3] <- NA
rowSums.dist(d, na.rm = TRUE)
rowMeans.dist(d, na.rm = TRUE)



