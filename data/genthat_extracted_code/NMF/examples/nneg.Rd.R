library(NMF)


### Name: nneg
### Title: Transforming from Mixed-sign to Nonnegative Data
### Aliases: nneg nneg,matrix-method nneg-methods nneg,NMF-method posneg
###   rposneg rposneg,matrix-method rposneg-methods rposneg,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# nneg,matrix-method
#----------
# random mixed sign data (normal distribution)
set.seed(1)
x <- rmatrix(5,5, rnorm, mean=0, sd=5)
x

# pmax (default)
nneg(x)
# using a threshold
nneg(x, threshold=2)
# without shifting the entries lower than threshold
nneg(x, threshold=2, shift=FALSE)

# posneg: split positive and negative part
nneg(x, method='posneg')
nneg(x, method='pos', threshold=2)

# absolute
nneg(x, method='absolute')
nneg(x, method='abs', threshold=2)

# min
nneg(x, method='min')
nneg(x, method='min', threshold=2)

#----------
# nneg,NMF-method
#----------
# random
M <- nmfModel(x, rmatrix(ncol(x), 3))
nnM <- nneg(M)
basis(nnM)
# mixture coefficients are not affected
identical( coef(M), coef(nnM) )

#----------
# posneg
#----------
# shortcut for the "posneg" transformation
posneg(x)
posneg(x, 2)

#----------
# rposneg,matrix-method
#----------
# random mixed sign data (normal distribution)
set.seed(1)
x <- rmatrix(5,5, rnorm, mean=0, sd=5)
x

# posneg-transform: split positive and negative part
y <- posneg(x)
dim(y)
# posneg-reverse
z <- rposneg(y)
identical(x, z)
rposneg(y, unstack=FALSE)

# But posneg-transformation with a non zero threshold is not reversible
y1 <- posneg(x, 1)
identical(rposneg(y1), x)

#----------
# rposneg,NMF-method
#----------
# random mixed signed NMF model
M <- nmfModel(rmatrix(10, 3, rnorm), rmatrix(3, 4))
# split positive and negative part
nnM <- posneg(M)
M2 <- rposneg(nnM)
identical(M, M2)



