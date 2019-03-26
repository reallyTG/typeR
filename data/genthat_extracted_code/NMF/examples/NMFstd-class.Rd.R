library(NMF)


### Name: NMFstd-class
### Title: NMF Model - Standard model
### Aliases: NMFstd-class

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a completely empty NMFstd object
new('NMFstd')

# create a NMF object based on one random matrix: the missing matrix is deduced
# Note this only works when using factory method NMF
n <- 50; r <- 3;
w <- rmatrix(n, r)
nmfModel(W=w)

# create a NMF object based on random (compatible) matrices
p <- 20
h <- rmatrix(r, p)
nmfModel(W=w, H=h)

# create a NMF object based on incompatible matrices: generate an error
h <- rmatrix(r+1, p)
try( new('NMFstd', W=w, H=h) )
try( nmfModel(w, h) )

# Giving target dimensions to the factory method allow for coping with dimension
# incompatibilty (a warning is thrown in such case)
nmfModel(r, W=w, H=h)



