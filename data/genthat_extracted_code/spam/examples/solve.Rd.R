library(spam)


### Name: spam solve
### Title: Linear Equation Solving for Sparse Matrices
### Aliases: backsolve forwardsolve backsolve-methods backsolve,ANY-method
###   backsolve,spam-method backsolve,matrix-method backsolve.spam
###   forwardsolve-methods forwardsolve,ANY-method forwardsolve,spam-method
###   forwardsolve,matrix-method forwardsolve.spam chol2inv.spam
###   chol2inv,spam-method chol2inv,spam.chol.NgPeyton-method solve.spam
###   solve,ANY-method solve,spam-method
### Keywords: algebra

### ** Examples

# Generate multivariate form a covariance inverse:
# (usefull for GRMF)
set.seed(13)
n <- 25    # dimension
N <- 1000  # sample size
Sigmainv <- .25^abs(outer(1:n,1:n,"-"))
Sigmainv <- as.spam( Sigmainv, eps=1e-4)


Sigma <- solve( Sigmainv)  # for verification 
iidsample <- array(rnorm(N*n),c(n,N))

mvsample <- backsolve( chol(Sigmainv), iidsample)
norm( var(t(mvsample)) - Sigma)

# compare with:
mvsample <- backsolve( chol(as.matrix( Sigmainv)), iidsample, n)
   #### ,n as patch 
norm( var(t(mvsample)) - Sigma)



# 'solve' step by step:
b <- rnorm( n)
R <- chol(Sigmainv)
norm( backsolve( R, forwardsolve( R, b))-
      solve( Sigmainv, b) )
norm( backsolve( R, forwardsolve( R, diag(n)))- Sigma )


# 'update':
R1 <- update( R, Sigmainv + diag.spam( n))






