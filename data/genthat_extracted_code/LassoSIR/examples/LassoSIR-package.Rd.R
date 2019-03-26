library(LassoSIR)


### Name: LassoSIR-Package
### Title: Sparsed Sliced Inverse Regression via Lasso
### Aliases: LassoSIR-Package
### Keywords: Lasso-SIR

### ** Examples


p <- 10
n <- 200


H <- 20
m <- n/H

beta <- array(0, c(p, 1) )
beta[1:3,1] <- rnorm(3, 0, 1)

X <- array(0, c(n, p ) )

rho <- 0.3
Sigma <- diag(p)
elements <- rho^(c((p-1):0,1:(p-1) ) )
for(i in 1:p)
    Sigma[i,] <- elements[(p+1-i):(2*p-i) ]


X <- matrix( rnorm(p*n), c(n, p) )
X <- X%*% chol(Sigma)

Y <-  ( X%*% beta )^3/2 + rnorm(n,0,1)
sir.lasso <- LassoSIR( X, Y, H, choosing.d="automatic",
          solution.path=FALSE, categorical=FALSE, nfolds=10,
          screening=FALSE)
beta.hat <- sir.lasso$beta/sqrt( sum( sir.lasso$beta^2 ) )




