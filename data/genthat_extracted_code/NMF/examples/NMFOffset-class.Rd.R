library(NMF)


### Name: NMFOffset-class
### Title: NMF Model - Nonnegative Matrix Factorization with Offset
### Aliases: initialize,NMFOffset-method NMFOffset-class
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a completely empty NMF object
new('NMFOffset')

# create a NMF object based on random (compatible) matrices
n <- 50; r <- 3; p <- 20
w <- rmatrix(n, r)
h <- rmatrix(r, p)
nmfModel(model='NMFOffset', W=w, H=h, offset=rep(0.5, nrow(w)))

# apply Nonsmooth NMF algorithm to a random target matrix
V <- rmatrix(n, p)
## Not run: nmf(V, r, 'offset')

# random NMF model with offset
rnmf(3, 10, 5, model='NMFOffset')



