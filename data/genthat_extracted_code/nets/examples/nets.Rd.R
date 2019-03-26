library(nets)


### Name: nets
### Title: Network Estimation for Time Series
### Aliases: nets print.nets predict.nets
### Keywords: network multivariate timeseries

### ** Examples


N <- 5
P <- 3
T <- 1000

A <- array(0,dim=c(N,N,P))
C <- matrix(0,N,N)

A[,,1]   <- 0.7 * diag(N) 
A[,,2]   <- 0.2 * diag(N) 
A[1,2,1] <- 0.2
A[4,3,2] <- 0.2

C      <- diag(N)
C[1,1] <- 2
C[4,2] <- -0.2
C[2,4] <- -0.2
C[1,3] <- -0.1
C[1,3] <- -0.1

Sig    <- solve(C)
L      <- t(chol(Sig))

y      <- matrix(0,T,N)
eps    <- rep(0,N)

for( t in (P+1):T ){
  z <- rnorm(N)
  for( i in 1:N ){
    eps[i] <- sum( L[i,] * z )
  }
  for( l in 1:P ){
    for( i in 1:N ){
      y[t,i] <- y[t,i] + sum(A[i,,l] * y[t-l,])
    }
  }
  y[t,] <-  y[t,] +  eps
}

lambda <- c(1,2)
system.time( mdl <- nets(y,P,lambda=lambda*T,verbose=TRUE)  )

mdl



