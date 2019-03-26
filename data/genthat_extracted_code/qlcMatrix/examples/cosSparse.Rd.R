library(qlcMatrix)


### Name: cosSparse
### Title: Cosine similarity between columns (sparse matrices)
### Aliases: cosSparse cosMissing idf isqrt none norm2 norm1 normL

### ** Examples

# functional upto limits of RAM of the hardware used
# consider removing small values of result to improve sparsity

## Not run: 
##D 
##D X <- rSparseMatrix(1e6, 1e6, 1e7)
##D print(object.size(X), units = "auto") # 118 Mb
##D system.time(M <- cosSparse(X)) # might take half a minute, depending on hardware
##D print(object.size(M), units = "auto") # 587 Mb
##D M <- drop0(M, tol = 0.1) # remove small values
##D print(object.size(M), units = "auto") # reduced to 141 Mb
## End(Not run)

# Compare various weightings.
# with random data from a normal distribution there is almost no difference
#
# data from a normal distribution
# X <- rSparseMatrix(1e2, 1e2, 1e3) 

# with heavily skewed data there is a strong difference!
X <- rSparseMatrix(1e2, 1e2, 1e3,
	rand.x = function(n){round(rpois(1e3, 10), 2)})

w0 <- cosSparse(X, norm = norm2, weight = NULL)@x
wi <- cosSparse(X, norm = norm2, weight = idf)@x
ws <- cosSparse(X, norm = norm2, weight = isqrt)@x

pairs(~ w0 + wi + ws, 
  labels=c("no weighting","inverse\ndocument\nfrequency","inverse\nsquare root"))




