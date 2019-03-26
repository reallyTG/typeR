library(qlcMatrix)


### Name: rowMax
### Title: Row and column extremes (sparse matrices)
### Aliases: rowMax colMax rowMin colMin

### ** Examples

# rowMax(X, ignore.zero = FALSE) is the same as apply(X, 1, max)
# however, with large sparse matrices, the 'apply' approach will start eating away at memory
# and things become slower.
X <- rSparseMatrix(1e3, 1e3, 1e2)
system.time(m1 <- rowMax(X, ignore.zero = FALSE))
system.time(m2 <- apply(X, 1, max)) # slower
all.equal(as.vector(m1), m2) # but same result

# to see the effect even stronger, try something larger
# depending on the amount of available memory, the 'apply' approach will give an error
# "problem too large"
## Not run: 
##D X <- rSparseMatrix(1e6, 1e6, 1e6)
##D system.time(m1 <- rowMax(X, ignore.zero = FALSE))
##D system.time(m2 <- apply(X, 1, max))
## End(Not run)

# speed depends most strongly on the number of entries in the matrix
# also some performance loss with size of matrix
# up to 1e5 entries is still reasonably fast

X <- rSparseMatrix(1e7, 1e7, 1e5)
system.time(m <- rowMax(X))

## Not run: 
##D X <- rSparseMatrix(1e7, 1e7, 1e7)
##D system.time(M <- rowMax(X)) # about ten times as slow
## End(Not run)

# apply is not feasably on such large matrices
# Error: problem too large...
## Not run: 
##D m <- apply(X, 1, max) 
## End(Not run)



