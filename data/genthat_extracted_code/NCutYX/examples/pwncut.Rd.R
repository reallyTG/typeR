library(NCutYX)


### Name: pwncut
### Title: Cluster the Columns of X into K Clusters by Giving a Weighted
###   Cluster Membership while shrinking Weights Towards Each Other.
### Aliases: pwncut

### ** Examples

# This sets up the initial parameters for the simulation.
n <- 100 # Sample size
p <- 100 # Number of columns of Y.
K <- 3

C0            <- matrix(0,p,K)
C0[1:25,1]    <- matrix(1,25,1)
C0[26:75,1:3] <- matrix(1/3,50,3)
C0[76:100,3]  <- matrix(1,25,1)

A0 <- C0[ ,1]%*%t(C0[ ,1]) + C0[ ,2]%*%t(C0[ ,2]) +
      C0[ ,3]%*%t(C0[ ,3])
A0 <- A0 - diag(diag(A0)) + diag(p)

Z1 <- rnorm(n,0,2)
Z2 <- rnorm(n,0,2)
Z3 <- rnorm(n,0,2)

Y <- matrix(0,n,p)
Y[ ,1:25]   <-  matrix(rnorm(n*25, 0, 2), n, 25) + matrix(Z1, n, 25, byrow=FALSE)
Y[ ,26:75]  <-  matrix(rnorm(n*50, 0, 2), n, 50) + matrix(Z1, n, 50, byrow=FALSE) +
                matrix(Z2, n, 50, byrow=FALSE) + matrix(Z3, n, 50, byrow=FALSE)
Y[ ,76:100] <-  matrix(rnorm(n*25, 0, 2), n, 25) + matrix(Z3, n, 25, byrow=FALSE)

trial <- pwncut(Y,
                K       = 3,
                B       = 10000,
                L       = 1000,
                lambda  = 1.5,
                start   = 'default',
                scale   = TRUE,
                nstarts = 1,
                epsilon = 0,
                dist    = 'correlation',
                sigma   = 10)

A1 <- trial[[2]][ ,1]%*%t(trial[[2]][ ,1]) +
      trial[[2]][ ,2]%*%t(trial[[2]][ ,2]) +
      trial[[2]][ ,3]%*%t(trial[[2]][ ,3])

A1 <- A1 - diag(diag(A1)) + diag(p)

plot(trial[[1]], type='l')
errorL <- sum(abs(A0-A1))/p^2
errorL



