library(NMF)


### Name: rnmf
### Title: Generating Random NMF Models
### Aliases: rnmf rnmf,ANY,data.frame-method rnmf,ANY,matrix-method
###   rnmf,formula,ANY-method rnmf-methods rnmf,missing,missing-method
###   rnmf,NMF,missing-method rnmf,NMF,numeric-method
###   rnmf,NMFOffset,numeric-method rnmf,numeric,missing-method
###   rnmf,numeric,numeric-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# rnmf,NMFOffset,numeric-method
#----------
# random NMF model with offset
x <- rnmf(2, 3, model='NMFOffset')
x
offset(x)
# from a matrix
x <- rnmf(2, rmatrix(5,3, max=10), model='NMFOffset')
offset(x)

#----------
# rnmf,NMF,numeric-method
#----------
## random NMF of same class and rank as another model

x <- nmfModel(3, 10, 5)
x
rnmf(x, 20) # square
rnmf(x, 20, 13)
rnmf(x, c(20, 13))

# using another distribution
rnmf(x, 20, dist=rnorm)

# other than standard model
y <- rnmf(3, 50, 10, model='NMFns')
y
## Don't show: 
 stopifnot( identical(dim(y), c(50L,10L,3L)) ) 
## End(Don't show)
## Don't show: 
 stopifnot( is(y, 'NMFns') ) 
## End(Don't show)

#----------
# rnmf,ANY,matrix-method
#----------
# random NMF compatible with a target matrix
x <- nmfModel(3, 10, 5)
y <- rmatrix(20, 13)
rnmf(x, y) # rank of x
rnmf(2, y) # rank 2

#----------
# rnmf,NMF,missing-method
#----------
## random NMF from another model

a <- nmfModel(3, 100, 20)
b <- rnmf(a)
## Don't show: 
 stopifnot( !nmf.equal(a,b) ) 
## End(Don't show)

#----------
# rnmf,numeric,missing-method
#----------
# random NMF model with known basis matrix
x <- rnmf(5, W=matrix(1:18, 6)) # 6 x 5 model with rank=3
basis(x) # fixed
coef(x) # random

# random NMF model with known coefficient matrix
x <- rnmf(5, H=matrix(1:18, 3)) # 5 x 6 model with rank=3
basis(x) # random
coef(x) # fixed

# random model other than standard NMF
x <- rnmf(5, H=matrix(1:18, 3), model='NMFOffset')
basis(x) # random
coef(x) # fixed
offset(x) # random

#----------
# rnmf,missing,missing-method
#----------
# random model other than standard NMF
x <- rnmf(W=matrix(1:18, 6), H=matrix(21:38, 3), model='NMFOffset')
basis(x) # fixed
coef(x) # fixed
offset(x) # random

#----------
# rnmf,numeric,numeric-method
#----------
## random standard NMF of given dimensions

# generate a random NMF model with rank 3 that fits a 100x20 matrix
rnmf(3, 100, 20)
## Don't show: 
 stopifnot( identical(dim(rnmf(3, 100, 20)), c(100L,20L,3L)) ) 
## End(Don't show)
# generate a random NMF model with rank 3 that fits a 100x100 matrix
rnmf(3, 100)
## Don't show: 
 stopifnot( identical(dim(rnmf(3, 100)), c(100L,100L,3L)) ) 
## End(Don't show)



