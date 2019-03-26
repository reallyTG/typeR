library(qlcMatrix)


### Name: corSparse
### Title: Pearson correlation between columns (sparse matrices)
### Aliases: corSparse

### ** Examples

## Not run: 
##D 
##D # reasonably fast (though not instantly!) with
##D # sparse matrices up to a resulting matrix size of 1e8 cells.
##D # However, the calculations and the resulting matrix take up lots of memory
##D 
##D X <- rSparseMatrix(1e4, 1e4, 1e5)
##D system.time(M <- corSparse(X))
##D print(object.size(M), units = "auto") # more than 750 Mb
##D 
##D # Most values are low, so it often makes sense 
##D # to remove low values to keep results sparse
##D 
##D M <- drop0(M, tol = 0.4)
##D print(object.size(M), units = "auto") # normally reduces size by half or more
##D length(M@x) / prod(dim(M)) # down to less than 0.05% non-zero entries
## End(Not run)

# comparison with other methods
# corSparse is much faster than cor from the stats package
# but cosSparse is even quicker than both!

X <- rSparseMatrix(1e3, 1e3, 1e4)
X2 <- as.matrix(X)

# if there is a warning, try again with different random X
system.time(McorRegular <- cor(X2)) 
system.time(McorSparse <- corSparse(X))
system.time(McosSparse <- cosSparse(X))

# cor and corSparse give identical results

all.equal(McorSparse, McorRegular)

# corSparse and cosSparse are not identical, but close

McosSparse <- as.matrix(McosSparse)
dimnames(McosSparse) <- NULL
all.equal(McorSparse, McosSparse) 

# Actually, cosSparse and corSparse are *almost* identical!

cor(as.dist(McorSparse), as.dist(McosSparse))

# Visually it looks completely identical
# Note: this takes some time to plot

## Not run: 
##D plot(as.dist(McorSparse), as.dist(McosSparse))	
## End(Not run)

# So: consider using cosSparse instead of cor or corSparse.
# With sparse matrices, this gives mostly the same results, 
# but much larger matrices are possible
# and the computations are quicker and more sparse




