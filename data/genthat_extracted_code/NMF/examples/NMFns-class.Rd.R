library(NMF)


### Name: NMFns-class
### Title: NMF Model - Nonsmooth Nonnegative Matrix Factorization
### Aliases: NMFns-class

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# create a completely empty NMFns object
new('NMFns')

# create a NMF object based on random (compatible) matrices
n <- 50; r <- 3; p <- 20
w <- rmatrix(n, r)
h <- rmatrix(r, p)
nmfModel(model='NMFns', W=w, H=h)

# apply Nonsmooth NMF algorithm to a random target matrix
V <- rmatrix(n, p)
## Not run: nmf(V, r, 'ns')

# random nonsmooth NMF model
rnmf(3, 10, 5, model='NMFns', theta=0.3)



