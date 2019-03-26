library(NMF)


### Name: rmatrix
### Title: Generating Random Matrices
### Aliases: rmatrix rmatrix,ANY-method rmatrix-methods rmatrix,NMF-method
###   rmatrix,numeric-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# rmatrix,numeric-method
#----------
## Generate a random matrix of a given size
rmatrix(5, 3)
## Don't show: 
 stopifnot( identical(dim(rmatrix(5, 3)), c(5L,3L)) ) 
## End(Don't show)

## Generate a random matrix of the same dimension of a template matrix
a <- matrix(1, 3, 4)
rmatrix(a)
## Don't show: 
 stopifnot( identical(dim(rmatrix(a)), c(3L,4L)) ) 
## End(Don't show)

## Specificy the distribution to use

# the default is uniform
a <- rmatrix(1000, 50)
## Not run:  hist(a) 

# use normal ditribution
a <- rmatrix(1000, 50, rnorm)
## Not run:  hist(a) 

# extra arguments can be passed to the random variate generation function
a <- rmatrix(1000, 50, rnorm, mean=2, sd=0.5)
## Not run:  hist(a) 

#----------
# rmatrix,ANY-method
#----------
# random matrix of the same dimension as another matrix
x <- matrix(3,4)
dim(rmatrix(x))

#----------
# rmatrix,NMF-method
#----------
# generate noisy fitted target from an NMF model (the true model)
gr <- as.numeric(mapply(rep, 1:3, 3))
h <- outer(1:3, gr, '==') + 0
x <- rnmf(10, H=h)
y <- rmatrix(x)
## Not run: 
##D # show heatmap of the noisy target matrix: block patterns should be clear
##D aheatmap(y)
## End(Not run)
## Don't show: 
 stopifnot( identical(dim(y), dim(x)[1:2]) ) 
## End(Don't show)

# test NMF algorithm on noisy data
# add some noise to the true model (drawn from uniform [0,1])
res <- nmf(rmatrix(x), 3)
summary(res)

# add more noise to the true model (drawn from uniform [0,10])
res <- nmf(rmatrix(x, max=10), 3)
summary(res)



