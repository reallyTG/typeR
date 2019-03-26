library(spam)


### Name: chol
### Title: Cholesky Factorization for Sparse Matrices
### Aliases: chol.spam chol,ANY-method chol,matrix-method chol,spam-method
###   update.spam update,spam.chol.NgPeyton-method
###   update.spam.chol.NgPeyton
### Keywords: algebra

### ** Examples

# generate multivariate normals:
set.seed(13)
n <- 25    # dimension
N <- 1000  # sample size
Sigma <- .25^abs(outer(1:n,1:n,"-"))
Sigma <- as.spam( Sigma, eps=1e-4)

cholS <- chol( Sigma)    
# cholS is the upper triangular part of the permutated matrix Sigma
iord <- ordering(cholS, inv=TRUE)

R <- as.spam(cholS)
mvsample <- ( array(rnorm(N*n),c(N,n)) %*% R)[,iord]
# It is often better to order the sample than the matrix
# R itself. 

# 'mvsample' is of class 'spam'. We need to transform it to a
# regular matrix, as there is no method 'var' for 'spam' (should there?).
norm( var( as.matrix( mvsample)) - Sigma, type='m')
norm( t(R) %*% R - Sigma)


# To speed up factorizations, memory allocations can be optimized:
opt <- summary(cholS)
# here, some elements of Sigma may be changed...
cholS <- chol( Sigma, memory=list(nnzR=opt$nnzR,nnzcolindices=opt$nnzc))




