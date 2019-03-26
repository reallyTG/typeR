library(NMF)


### Name: nmfModel
### Title: Factory Methods NMF Models
### Aliases: nmfModel nmfModel,data.frame,data.frame-method
###   nmfModel,formula,ANY-method nmfModel,matrix,ANY-method
###   nmfModel,matrix,matrix-method nmfModel-methods
###   nmfModel,missing,ANY-method nmfModel,missing,missing-method
###   nmfModel,NULL,ANY-method nmfModel,numeric,matrix-method
###   nmfModel,numeric,missing-method nmfModel,numeric,numeric-method
###   nmfModels
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# nmfModel,numeric,numeric-method
#----------
# data
n <- 20; r <- 3; p <- 10
V <- rmatrix(n, p) # some target matrix

# create a r-ranked NMF model with a given target dimensions n x p as a 2-length vector
nmfModel(r, c(n,p)) # directly
nmfModel(r, dim(V)) # or from an existing matrix <=> nmfModel(r, V)
# or alternatively passing each dimension separately
nmfModel(r, n, p)

# trying to create a NMF object based on incompatible matrices generates an error
w <- rmatrix(n, r)
h <- rmatrix(r+1, p)
try( new('NMFstd', W=w, H=h) )
try( nmfModel(w, h) )
try( nmfModel(r+1, W=w, H=h) )
# The factory method can be force the model to match some target dimensions
# but warnings are thrown
nmfModel(r, W=w, H=h)
nmfModel(r, n-1, W=w, H=h)

#----------
# nmfModel,numeric,missing-method
#----------
## Empty model of given rank
nmfModel(3)

#----------
# nmfModel,missing,ANY-method
#----------
nmfModel(target=10) #square
nmfModel(target=c(10, 5))

#----------
# nmfModel,missing,missing-method
#----------
# Build an empty NMF model
nmfModel()

# create a NMF object based on one random matrix: the missing matrix is deduced
# Note this only works when using factory method NMF
n <- 50; r <- 3;
w <- rmatrix(n, r)
nmfModel(W=w)

# create a NMF object based on random (compatible) matrices
p <- 20
h <- rmatrix(r, p)
nmfModel(H=h)

# specifies two compatible matrices
nmfModel(W=w, H=h)
# error if not compatible
try( nmfModel(W=w, H=h[-1,]) )

#----------
# nmfModel,numeric,matrix-method
#----------
# create a r-ranked NMF model compatible with a given target matrix
obj <- nmfModel(r, V)
all(is.na(basis(obj)))

#----------
# nmfModel,matrix,matrix-method
#----------
## From two existing factors

# allows a convenient call without argument names
w <- rmatrix(n, 3); h <- rmatrix(3, p)
nmfModel(w, h)

# Specify the type of NMF model (e.g. 'NMFns' for non-smooth NMF)
mod <- nmfModel(w, h, model='NMFns')
mod

# One can use such an NMF model as a seed when fitting a target matrix with nmf()
V <- rmatrix(mod)
res <- nmf(V, mod)
nmf.equal(res, nmf(V, mod))

# NB: when called only with such a seed, the rank and the NMF algorithm
# are selected based on the input NMF model.
# e.g. here rank was 3 and the algorithm "nsNMF" is used, because it is the default
# algorithm to fit "NMFns" models (See ?nmf).

#----------
# nmfModel,matrix,ANY-method
#----------
## swapped arguments `rank` and `target`
V <- rmatrix(20, 10)
nmfModel(V) # equivalent to nmfModel(target=V)
nmfModel(V, 3) # equivalent to nmfModel(3, V)

#----------
# nmfModel,formula,ANY-method
#----------
# empty 3-rank model
nmfModel(~ 3)

# 3-rank model that fits a given data matrix
x <- rmatrix(20,10)
nmfModel(x ~ 3)

# add fixed coefficient term defined by a factor
gr <- gl(2, 5)
nmfModel(x ~ 3 + gr)

# add fixed coefficient term defined by a numeric covariate
nmfModel(x ~ 3 + gr + b, data=list(b=runif(10)))

# 3-rank model that fits a given ExpressionSet (with fixed coef terms)
e <- ExpressionSet(x)
pData(e) <- data.frame(a=runif(10))
nmfModel(e ~ 3 + gr + a) # `a` is looked up in the phenotypic data of x pData(x)

#----------
# nmfModels
#----------
# show all the NMF models available (i.e. the classes that inherit from class NMF)
nmfModels()
# show all the built-in NMF models available
nmfModels(builtin.only=TRUE)



